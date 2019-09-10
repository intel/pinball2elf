/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_ARCH_STATE_H_
#define _LTE_ARCH_STATE_H_

#include "lte_types.h"
#include "lte_utils.h"
#include "lte_portability.h"
#include "lte_syself.h"
#include "lte_strtab.h"
#include "lte_x86_state.h"
#include "lte_entry_point.h"

#include <stddef.h>
#include <vector>
#include <fstream>
#include <cctype>
#include <string>
#include <iostream>
#include <iomanip>


#ifdef USE_SAME_INDEXES
#define FIRST_LDT_ENTRY_NUM  0
#else
#define FIRST_LDT_ENTRY_NUM  ((LDT_ENTRIES)/2)
#endif

class config_t;

class lte_x86_arch_state_t {
protected:
    lte_thread_state_t* thread_state;
    lte_size_t threads_num;
    lte_size_t threads_num_max;
    lte_bool_t text_compressed;
    unsigned char arch;

    void clear();

public:
    lte_x86_arch_state_t(int entry_num = FIRST_LDT_ENTRY_NUM);
    ~lte_x86_arch_state_t();

    bool load(config_t& cfg);

    void print(void);

    unsigned char get_arch() const
    {
        return arch;
    }

    lte_size_t get_threads_num() const
    {
        return threads_num;
    }

    lte_bool_t get_text_compressed() const
    {
        return text_compressed;
    }

    lte_size_t get_threads_num_max() const
    {
        return threads_num;
    }
    lte_thread_state_t& get_thread_state(lte_size_t tid)
    {
        return thread_state[tid];
    }
};

#endif /* _LTE_ARCH_STATE_H_ */
