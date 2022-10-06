AS=as
ASFLAGS=--64
ifneq ($(DEBUG),)
ASFLAG += -g
endif

AR=ar
ARFLAGS=cr

CC=gcc
ifeq ($(DEBUG),)
#CFLAGS=-fPIC -O3 -fno-tree-loop-distribute-patterns
CFLAGS=-fPIC -O1 -fno-tree-loop-distribute-patterns -fno-stack-protector
else
CFLAGS=-fPIC -O0 -g -fno-stack-protector
endif
CFLAGS+=-I. -mcmodel=large -static -fno-zero-initialized-in-bss -fno-stack-protector
ifneq ($(PINCRT),)
#CFLAGS += -DPINCRT -I/usr/include/x86_64-linux-gnu/bits/types/
CFLAGS += -DPINCRT
endif


LIBCLE=libcle.a
LIBPERFLE=libperfle.a

LIBCLE_OBJECTS=libcle.o libcle_c.o
LIBPERFLE_OBJECTS=libperfle.o

OBJECTS=$(LIBCLE_OBJECTS) $(LIBPERFLE_OBJECTS)

all: $(LIBPERFLE) $(LIBCLE)

libcle: $(LIBCLE)

libperfle: $(LIBPERFLE)

$(LIBCLE): $(LIBCLE_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

$(LIBPERFLE): $(LIBPERFLE_OBJECTS) $(LIBCLE_OBJECTS)
	$(AR) $(ARFLAGS) $@ $^

%.o : %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJECTS) $(LIBCLE) $(LIBPERFLE)
