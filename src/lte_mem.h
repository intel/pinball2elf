/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_MEM_H
#define LTE_MEM_H

#include "lte_types.h"
#include <utility>

namespace mem
{
   template<lte_size_t _PageSize>
   class _Page
   {
      public:
         static_assert((_PageSize & (_PageSize - 1)) == 0, "page _size must be power of 2");

         static const lte_size_t SIZE = _PageSize;
         static lte_size_t size() { return _PageSize; }

         template<typename _Addr>
         static inline _Addr base(_Addr addr) { return addr & ~(_PageSize-1); }

         template<typename _Addr>
         static inline _Addr offset(_Addr addr) { return addr & (_PageSize-1); }

         template<typename _Addr>
         static inline bool contains(_Addr addr) { return addr < _PageSize; }
   };

   typedef _Page<4096> page;


   template<typename T>
   class segment_base {
   public:
      typedef T addr_type;
   protected:
      addr_type _base {0};
   public:
      segment_base() = default;
      segment_base(addr_type base) : _base(base) {}


      addr_type getbase() const
      {
         return _base;
      }
      void setbase(addr_type base)
      {
         this->_base = base;
      }
      addr_type linear_address(addr_type offs) const
      {
         return _base + offs;
      }
      addr_type offset(addr_type addr) const
      {
         return addr - _base;
      }
      bool lt(addr_type addr1, addr_type addr2) const
      {
         return offset(addr1) < offset(addr2);
      }
      bool gt(addr_type addr1, addr_type addr2) const
      {
         return offset(addr1) > offset(addr2);
      }
      bool le(addr_type addr1, addr_type addr2) const
      {
        return !gt(addr1, addr2);
      }
      bool ge(addr_type addr1, addr_type addr2) const
      {
         return !lt(addr1, addr2);
      }
   };

   template<typename T>
   class segment : public segment_base<T> {
   public:
      typedef segment_base<T> segment_base_type;
      typedef T addr_type;
      typedef T size_type;
   protected:
      size_type _size {~(size_type)0};
   public:
      segment() = default;
      segment(addr_type lo, addr_type hi) : segment_base_type(lo), _size(hi - lo) {}

      template<class T1, class T2>
      auto& operator = (const std::pair<T1, T2>& p)
      {
         auto s = p.second - p.first;
         this->setbase(p.first);
         this->_size = s;
         return *this;
      }

      bool empty() const { return _size == 0; }

      // address of the first byte
      addr_type begin() const { return this->getbase(); }
      // address of the byte next to the last byte
      addr_type end() const { return this->linear_address(_size); }

      bool in_range(addr_type addr) const
      {
         return this->offset(addr) < _size;
      }
      bool in_range_inclusive(addr_type addr) const
      {
         return this->offset(addr) <= _size;
      }
      bool in_range(addr_type addr, size_type length) const
      {
         auto offs = this->offset(addr);
         return (offs < _size) && (length <= (_size - offs));
      }
      size_type size() const
      {
         return _size;
      }
   };

};

#endif //LTE_MEM_H
