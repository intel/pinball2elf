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

$(test): $(objects) $(LIBS)
	$(PINBALL2ELF) -V -d $(test).global.log -m $(test).text -r $(test).address -b 0x4003f2 -b 0x5003f2 -b 0x6003f2 -b 0x7003f2 -p on_start -t on_thread_start -x $@ $^

$(objects):
%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@
%.o: %.s
	$(CC) -c $(ASFLAGS) $< -o $@

clean:
	rm -rf $(test) $(objects)
