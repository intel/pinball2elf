#BEGIN_LEGAL
#Copyright (c) 2004-2016, Intel Corporation. All rights reserved.
#
#Redistribution and use in source and binary forms, with or without
#modification, are permitted provided that the following conditions are
#met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#    * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials provided
#      with the distribution.
#
#    * Neither the name of Intel Corporation nor the names of its
#      contributors may be used to endorse or promote products derived
#      from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#END_LEGAL
######################################################################

COMPILER=gnu
#COMPILER=ms

ifeq ($(COMPILER),gnu)
  GCCVERSIONEQ5 := $(shell expr `g++ -dumpversion | cut -f1 -d.` \== 5)
  GCCVERSIONGTEQ7 := $(shell expr `g++ -dumpversion | cut -f1 -d.` \>= 7)
  GCCVERSIONGTEQ9 := $(shell expr `g++ -dumpversion | cut -f1 -d.` \>= 9)
  CC = gcc
  CXX = g++
  CXX_LINKER = $(CXX)
  RM = rm -f
  MKPATH = mkdir -p
  OBJEXT = o
  EXEEXT =
  CXXSRCEXT = cpp
  CCSRCEXT = c
  LIBEXT = a
  LINKOUT = -o
  OUTOPT = -o
  COPT = -c
  IOPT = -I

  FALIGN = 
  ifeq "$(GCCVERSIONGTEQ7)" "1"
  FALIGN =  -faligned-new -mcmodel=large
  endif
  WARN_SHOULD_BE_FIXED = -Wno-unused-parameter -Wno-unused-value                \
                         -Wno-unused-variable -Wno-unused-function              \
                         -Wno-multichar -Wno-parentheses -Wno-strict-aliasing   \
                         -Wno-sequence-point -Wno-switch                        \
                         -Wno-write-strings -Wno-format
  ifeq "$(GCCVERSIONGTEQ9)" "1"
  WARN_SHOULD_BE_FIXED +=   -Wno-address-of-packed-member -Wno-error=address-of-packed-member 
  endif

  WARNINGS     = -Wall -Wextra -Werror $(WARN_SHOULD_BE_FIXED) -fdiagnostics-show-option
  C_WARNINGS   = -Wnested-externs -Wdeclaration-after-statement
  CXX_WARNINGS = -Wno-invalid-offsetof -Wno-deprecated
  GUARDFLAGS = -fstack-protector-all # requires gcc 4.9 or higher

  CXXFLAGS_DBG = -g -O0 $(FALIGN) $(GUARDFLAGS) $(WARNINGS) $(CXX_WARNINGS)
  CCFLAGS_DBG  = -g -O0 $(FALIGN) $(GUARDFLAGS) $(WARNINGS) $(C_WARNINGS)
  LDFLAGS_DBG  = -g -O0

  CXXFLAGS_OPT = -g -O2 $(FALIGN) $(GUARDFLAGS) -DNDEBUG $(WARNINGS) $(CXX_WARNINGS)
  CCFLAGS_OPT  = -g -O2 $(FALIGN) $(GUARDFLAGS) -DNDEBUG $(WARNINGS) $(C_WARNINGS)
  LDFLAGS_OPT  = -g -O2

#  CXXFLAGS = -static
#  CCFLAGS  = -static
#  LDFLAGS = -static
endif

#@echo '********** Only gcc/g++ compiler supported (Linux only) ******'

LIBLE_PATH = lib
LIBPERFLE = $(LIBLE_PATH)/libperfle.a
LIBCLE = $(LIBLE_PATH)/libcle.a

CXXFLAGS += $(IOPT). 
CCFLAGS  += $(IOPT).

CXX_COMPILE_OPT = $(CXX) $(COPT) $(CXXFLAGS) $(CXXFLAGS_OPT)
CC_COMPILE_OPT  = $(CC) $(COPT) $(CCFLAGS) $(CCFLAGS_OPT)
CXX_LINK_OPT    = $(CXX_LINKER) $(LDFLAGS) $(LDFLAGS_OPT)
LINK_OPT        = $(CXX_LINK_OPT)

CXX_COMPILE_DBG = $(CXX) $(COPT) $(CXXFLAGS) $(CXXFLAGS_DBG)
CC_COMPILE_DBG  = $(CC)  $(COPT) $(CCFLAGS) $(CCFLAGS_DBG)
CXX_LINK_DBG    = $(CXX_LINKER) $(LDFLAGS) $(LDFLAGS_DBG)
LINK_DBG        = $(CXX_LINK_DBG)

  ifeq "$(GCCVERSIONEQ5)" "1"
    CXXFLAGS +=  -std=c++14 $(IOPT).
    CCFLAGS  +=  -std=c++14 $(IOPT).
  endif

######################################################################

LIT2ELF=pinball2elf$(EXEEXT)
LIT2ELFD=pinball2elfd$(EXEEXT)

######################################################################

LIT2ELF_OBJS = lit2elf.$(OBJEXT) \
	lte_arch_state.$(OBJEXT) \
	lte_config.$(OBJEXT) \
	lte_elf.$(OBJEXT) \
	lte_entry_point.$(OBJEXT) \
	lte_memimg.$(OBJEXT) \
	lte_pinball.$(OBJEXT) \
	lte_portability.$(OBJEXT) \
	lte_reg_enum.$(OBJEXT) \
	lte_string.$(OBJEXT) \
	lte_strtab.$(OBJEXT) \
	lte_utils.$(OBJEXT) \
	lte_x86_gpr.$(OBJEXT) \
	lte_x86_state.$(OBJEXT)

OBJDIR := obj
OBJDIR_OPT := $(OBJDIR)/opt
OBJDIR_DBG := $(OBJDIR)/dbg

OBJS_OPT := $(addprefix $(OBJDIR_OPT)/,$(LIT2ELF_OBJS))
OBJS_DBG := $(addprefix $(OBJDIR_DBG)/,$(LIT2ELF_OBJS))

.PHONY: clean clean_opt clean_dbg clean_extra_opt clean_extra_dbg $(OBJDIR_DBG) $(OBJDIR_OPT)

######################################################################

default: $(LIT2ELF) $(LIBPERFLE) $(LIBCLE)

dbg: $(LIT2ELFD) $(LIBPERFLE) $(LIBCLE)

opt: $(LIT2ELF) $(LIBPERFLE) $(LIBCLE)

all: $(LIT2ELF) $(LIT2ELFD) $(LIBPERFLE) $(LIBCLE)

######################################################################

$(OBJDIR_OPT)/%.$(OBJEXT): %.$(CXXSRCEXT)
	$(CXX_COMPILE_OPT) $< $(OUTOPT)$@

$(OBJDIR_OPT)/%.$(OBJEXT): %.$(CCSRCEXT)
	$(CC_COMPILE_OPT) $< $(OUTOPT)$@

$(OBJDIR_DBG)/%.$(OBJEXT): %.$(CXXSRCEXT)
	$(CXX_COMPILE_DBG) $< $(OUTOPT)$@

$(OBJDIR_DBG)/%.$(OBJEXT): %.$(CCSRCEXT)
	$(CC_COMPILE_DBG) $< $(OUTOPT)$@

$(LIT2ELF): $(OBJS_OPT) $(EXTRA_OPT_LIBS)
	$(LINK_OPT) $(LINKOUT)$@ $(OBJS_OPT) $(EXTRA_OPT_LIBS) $(EXTRA_LDFLAGS)

$(LIT2ELFD): $(OBJS_DBG) $(EXTRA_DBG_LIBS)
	$(LINK_DBG) $(LINKOUT)$@ $(OBJS_DBG) $(EXTRA_DBG_LIBS) $(EXTRA_LDFLAGS)

$(LIBPERFLE):
	$(MAKE) -C $(LIBLE_PATH)

$(LIBCLE):
	$(MAKE) -C $(LIBLE_PATH)

$(OBJS_OPT): | $(OBJDIR_OPT)

$(OBJS_DBG): | $(OBJDIR_DBG)

$(OBJDIR_OPT):
	$(MKPATH) $(OBJDIR_OPT)

$(OBJDIR_DBG):
	$(MKPATH) $(OBJDIR_DBG)

######################################################################

clean: clean_opt clean_dbg clean_extra_opt clean_extra_dbg clean_lib
	-@$(RM) -r $(OBJDIR_OPT) $(OBJDIR_DBG) $(OBJDIR)

clean_opt:
	-@$(RM) $(OBJDIR_OPT)/*.o $(LIT2ELF)

clean_dbg:
	-@$(RM) $(OBJDIR_DBG)/*.o $(LIT2ELFD)

clean_lib:
	-$(MAKE) -C $(LIBLE_PATH) clean

######################################################################
