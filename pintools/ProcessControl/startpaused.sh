#!/bin/bash
if [ "$#" -lt 1 ]; then echo "usage: setsid $0 <file> -- <cmd> <args>"; echo "starts application paused and writes PID to <file>"; exit 1; fi;
#if [ -f $1 ]; then echo "warning: overwriting $1"; fi
echo $$ > $1
shift
kill -SIGSTOP $$
exec "$@"

