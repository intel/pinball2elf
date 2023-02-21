VERBOSE?=0
CC=gcc
CFLAGS=-g -O2 -DVERBOSE=$(VERBOSE)
LDFLAGS=
DEPS=pstree.h
EXE=pstree-icount pstree-timedrun pstree-pccount pstree-threadperf

all: $(EXE)

pstree-icount: pstree-icount.o pstree.o
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

pstree-timedrun: pstree-timedrun.o pstree.o
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

pstree-pccount: pstree-pccount.o pstree.o
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

pstree-threadperf: pstree-threadperf.o pstree.o
	$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $< 

.PHONY: clean

clean:
	rm -f *.o $(EXE)
