PINBALL2ELF_ROOT=../../..
PINBALL2ELF=$(PINBALL2ELF_ROOT)/src/pinball2elf

test=hello

OPTFLAGS=-O2

CC=gcc
CXX=g++
CFLAGS = $(OPTFLAGS) -I. -I$(PINBALL2ELF_ROOT)/src/lib -Wall -Werror
CXXFLAGS=$(CFLAGS) -std=c++17

LIBS=$(PINBALL2ELF_ROOT)/src/lib/libcle.a $(PINBALL2ELF_ROOT)/src/lib/libperfle.a

csource += callbacks.c
objects = $(patsubst %.cc, %.o, $(cxxsource)) $(patsubst %.c, %.o, $(csource)) $(patsubst %.s, %.o, $(asmsource))

break=-b 0x4003f2
rel=-I 0x4003eb:on4003eb:2,0,0,0


$(test): $(objects) $(LIBS)
	$(PINBALL2ELF) -V -d $(test).global.log -s $(test).0.reg -m $(test).text -r $(test).address $(break) $(rel) -p on_start -x $@ $^

$(objects):
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
%.o: %.s
	$(CC) -c $(ASFLAGS) $< -o $@

clean:
	rm -rf $(test) $(objects)
