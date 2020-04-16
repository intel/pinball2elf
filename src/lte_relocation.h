/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_RELOCATION_H
#define LTE_RELOCATION_H

#include "lte_types.h"
#include "lte_utils.h"


const lte_int_t BR_REL_DISP8_SIZE = 2;
const lte_int_t BR_REL_DISP32_SIZE = 5;
const lte_int_t BR_IDIR_ABS64_SIZE = 14;
const lte_int_t BR_DISP8_MAX = 0x7f; 
const lte_int_t BR_DISP32_MAX = 0x7fffffff; 

const lte_int_t CALL_REL_DISP32_SIZE = 5;
const lte_int_t CALL_IDIR_RAX_SIZE = 12;

const lte_int_t MOV_IMM32_RDI = 7;


// Maximum size of patch (of jmp instruction)
const lte_uint32_t REL_PROBE_MAX_LENGTH = BR_IDIR_ABS64_SIZE;
// size of jump and max instruction length (last byte can be the beginning if an instruction)
const lte_uint32_t REL_RCODE_MAX_LENGTH = REL_PROBE_MAX_LENGTH + 16;
const lte_uint32_t REL_CTLT_MAX_LENGTH = REL_PROBE_MAX_LENGTH * BR_IDIR_ABS64_SIZE;
const lte_uint32_t REL_PROLOGUE_SIZE = CALL_IDIR_RAX_SIZE * 3 + MOV_IMM32_RDI;
const lte_uint32_t REL_EPILOGUE_SIZE = BR_IDIR_ABS64_SIZE;


struct inst_rinfo_t {
   lte_uint32_t r_offset;
   union {
      lte_uint32_t r_info;
      struct {
         lte_uint8_t r_inst_size;
         lte_uint8_t r_disp_width;
         lte_uint8_t r_inst_type;
      };
   };

   lte_uint32_t inst_size() const { return r_inst_size; } 
   lte_uint32_t disp_width() const { return r_disp_width; } 
   bool is_branch() const { return ((r_inst_type & 1) != 0); } 
};

typedef struct {
   lte_uint8_t opcode;
   union {
      lte_int32_t disp32;
      lte_int16_t disp16; // not supported in 64-bit mode
      lte_int8_t disp8;
   };
} __lte_packed jmp_disp_t;

typedef struct {
   lte_uint16_t opcode {0x25ff};
   lte_int32_t  disp32 {0};
   lte_uint64_t target {0};   
} __lte_packed jmp_indirect_t;

struct text_rinfo_t {
   inst_rinfo_t info[REL_PROBE_MAX_LENGTH]; 
   lte_uint_t count {0};
   lte_size_t size {0};

   text_rinfo_t() = default;

   static size_t max_size() { return sizeof(info)/sizeof(*info); }
   
   void clear() { count = 0; size = 0; }

   bool push_back(lte_uint64_t r_offset, lte_uint32_t r_info)
   {
      if(count >= max_size())
         return false;
      info[count].r_offset = r_offset;
      info[count].r_info = r_info;
      ++count;
      return true;
   }

   lte_size_t get_rcode_size(lte_size_t rmem_size);

   std::pair<lte_ssize_t, lte_ssize_t> get_disp_range(lte_uint8_t* mem, lte_size_t mem_sizem, bool memop_only = false);
};

class relocation {
   public:
      typedef struct {
         lte_uint8_t data[REL_RCODE_MAX_LENGTH];
      } rcode_buffer_t;

   private:
      lte_uint8_t _code_buffer[REL_PROLOGUE_SIZE + REL_RCODE_MAX_LENGTH + REL_EPILOGUE_SIZE + REL_CTLT_MAX_LENGTH];
      lte_size_t _rcode_size {0};
      lte_size_t _pro_size {0};
      lte_size_t _epi_size {0};
      lte_size_t _ctlt_size {0};
      lte_size_t _cb_offset {0};

   public:
      relocation() = default;

      lte_uint8_t* get_rcode() { return _code_buffer + _pro_size; }
      lte_size_t get_rcode_size() const { return _rcode_size; }
      lte_uint8_t* get_code() { return _code_buffer; }
      lte_size_t get_code_size() const { return _pro_size + _rcode_size + _epi_size + _ctlt_size; }
      lte_size_t get_cb_offset() const { return _cb_offset; }
     

      lte_size_t get_code_max_size(lte_uint8_t* code, lte_size_t size, text_rinfo_t* rinfo);

      lte_size_t init(lte_addr_t addr, lte_ssize_t offset, lte_uint8_t* code, lte_size_t size, text_rinfo_t* rinfo,
                      lte_addr_t save_ctx_addr, lte_addr_t rstor_ctx_addr, lte_addr_t cb_addr);

      static lte_uint8_t* get_save_ctx_code();
      static lte_uint8_t* get_rstor_ctx_code();
      static lte_size_t get_save_ctx_size();
      static lte_size_t get_rstor_ctx_size();

};

#endif //LTE_RELOCATION_H
