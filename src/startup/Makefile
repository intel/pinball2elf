ARCH?=64
ASFLAGS=--64
LDFLAGS=-m elf_x86_64


ifeq ($(ARCH),64)
# x86_64, st
else
ifeq ($(ARCH),64mt)
# x86_64, mt
else
ifeq ($(ARCH),32)
# i386, st
LDFLAGS=-m elf_i386
ASFLAGS=--32
else
ifeq ($(ARCH),32mt)
# i386, mt
LDFLAGS=-m elf_i386
ASFLAGS=--32
else
$(error Wrong ARCH value)
endif
endif
endif
endif

TARGET=litstart$(ARCH)

all: $(TARGET)

OBJECTS=$(TARGET).o $(TARGET)_state.o $(TARGET)_lit.o

$(TARGET): $(OBJECTS)
	ld $(LDFLAGS) -o $@ $^
	@[ -r $@ ] && objdump -d $@ >$@.dis
	@[ -r $@ ] && objdump -t $@ >$@.sym
	@[ -r $@ ] && readelf -a $@ >$@.elf
	@[ -r $@.dis ] && ./dumpstart.pl $@.dis >$@.c

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm $(OBJECTS) $(TARGET) $(TARGET).dis $(TARGET).sym $(TARGET).elf