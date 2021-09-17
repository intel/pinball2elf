#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
TMPDIR=/tmp
export CWD=""
if [ ! -z $P2E_TEMP ];
then
   TMPDIR=$P2E_TEMP
fi
echo "TMPDR $TMPDIR"

ERROR()
{
  echo "Usage : " $0 " pinball filename-prefix wpb-prefix" 
  exit 1
}

FATCHECK()
{
 pb=$1
 glog=$pb.global.log
 if [ ! -e $glog ];
 then
    echo "ERROR: *.global.log file not found for $pb" 
    exit 1
 fi
 fatrec=`grep "fat: " $glog`
 if [ -z "$fatrec" ]; 
 then
    echo "ERROR: 'fat: ' not found for $pb" 
    exit 1
 fi
 isfat=`grep "fat: " $glog | awk '{print $NF}'`
 if [ $isfat -eq 1 ];
 then
    echo "$pb WAS created with '-log:fat'" 
 else
    echo "ERROR: $pb was not created with '-log:fat'" 
    exit 1
 fi
}

SETENV()
{
  cfile=$1

  cat $INST/environ.c | awk '
  BEGIN {flag=0}
  /END_LEGAL/ {flag=1; next}
      {if(flag) print $0}
  ' >> $cfile
}

SETHEAP()
{
  brkfile=$1
  cfile=$2

  first_brk_addr=`cat $brkfile | head -1`
  last_brk_addr=`cat $brkfile | tail -1`
  
  echo "#include <sys/prctl.h>" >> $cfile
  echo "__lte_static  uint64_t FIRST_BRK_ADDR=$first_brk_addr;" >> $cfile
  echo "__lte_static  uint64_t LAST_BRK_ADDR=$last_brk_addr;" >> $cfile
  cat $INST/set_heap.c | awk '
  BEGIN {flag=0}
  /END_LEGAL/ {flag=1; next}
      {if(flag) print $0}
  ' >> $cfile
}

PREOPEN()
{
  sysstate=$1
  cfile=$2
  echo "void preopen_files()" >> $cfile
  echo "{" >> $cfile
  rootcount=`ls $sysstate | wc -l`
  if [ $rootcount -gt 1 ];
  then
    echo "     lte_write(1, "\"WARNING: ELFie will open files with absolute pathname. Consider using 'chroot'.\\\n\"", sizeof("\"WARNING: ELFie will open files with absolute pathname. Consider using 'chroot'.\\\n\"")-1);" >> $cfile
  fi
  nonFDcount=`ls $sysstate | grep -v FD_ | wc -l`
  if [ $nonFDcount -gt 1 ];
  then
    echo "     lte_write(1, "\"ELFie will open local files. Must be in \'sysstate$CWD\' to succeed.\\\n\"", sizeof("\"ELFie will open local files. Must be in \'sysstate$CWD\' to succeed.\\\n\"")-1);" >> $cfile
  fi
  if test "$( find $sysstate -name "FD_*" -print -quit)"
  then
    echo "int myfd = 0;" >> $cfile
    echo "     lte_write(1, "\"preopen_files\(\):\"", sizeof("\"preopen_files\(\):\"")-1);" >> $cfile
    echo "     lte_write(1, "\"#must be in \'sysstate$CWD\' to succeed \\\n\"", sizeof("\"#must be in \'sysstate$CWD\' to succeed \\\n\"")-1);" >> $cfile
    for p in `find $sysstate -name "FD_*"`
    do
#pinball/perlbench-r.3_58573_globalr5_warmupendPC0x0004c7c6b_warmupendPCCount138041_warmuplength800000017_endPC0x0004d1d7c_endPCCount96403_length200000010_multiplier7-000_005_0-05600.0.sysstate/FD_0
      f=`basename $p` 
      fd=`echo $f | awk -F"_" '{print $2}'`
      if [ $fd -eq 2 ];
      then
         echo "Skipping 'stderr' re-direction with $f"
      else
        echo "  myfd = lte_syscall(__NR_open, (uint64_t)\"$f\", O_RDWR,S_IRWXU,0,0,0);" >> $cfile
        echo "    if( myfd < 0 )" >> $cfile
        echo "     lte_write(1, "\"could not pre-open $f \\\n\"", sizeof("\"could not pre-open $f \\\n\"")-1);" >> $cfile
        echo "    else" >> $cfile
        echo "     lte_syscall(__NR_dup2, myfd, $fd,0,0,0,0);" >> $cfile
      fi
    done
  fi
  echo "}" >> $cfile
}

SET_ROICOUNTS()
{
  pinball=$1
  tid=$2
  etid=$3
  startseen=`grep -c "Sim-Start"  $pinball.event_icount.$tid.txt`
  if [ $startseen -eq 0 ];
  then
    return
  fi
  endseen=`grep -c "Sim-End"  $pinball.event_icount.$tid.txt`
  if [ $endseen -gt 0 ]; # Sim-End exists
  then
    markercount=`grep -c "Marker"  $pinball.event_icount.$tid.txt`
    if [ $markercount -eq 8 ]; # PC-count with warmup
    then
#Marker  45768b tid: 0 addrcount 250983
      twpcaddr=`grep "Marker" $pinball.event_icount.$tid.txt | grep tid | head -1 | awk '{print "0x"$2}'`
      if [ $use_warmup -eq 1 ];
      then
        wpcaddr_arr[$etid]=$twpcaddr
      else
        wpcaddr_arr[$etid]="0" #No warmup
      fi
      twpccount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep "tid" |  head -1 | awk '{print $NF}'`
      if [ $use_warmup -eq 1 ];
      then
        wpccount_arr[$etid]=$twpccount
      else
        wpccount_arr[$etid]="0" #No warmup
      fi
      tspcaddr=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" | head -2 | tail -1 | awk '{print "0x"$2}'`
      pcaddr_arr[$etid]=$tspcaddr
      startcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  head -2 | tail -1 | awk '{print $NF}'`
      endcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  tail -1 | awk '{print $NF}'`
      #pccount_arr[$etid]=`echo $endcount - $startcount | bc`
      pccount_arr[$etid]=$endcount  # count from the beginning
    fi
    if [ $markercount -eq 4 ]; # PC-count with no warmup
    then
      tspcaddr=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  tail -1 | awk '{print "0x"$2}'`
      pcaddr_arr[$etid]=$tspcaddr
      startcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  head -1 | awk '{print $NF}'`
      endcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" | tail -1 | awk '{print $NF}'`
      #pccount_arr[$etid]=`echo $endcount - $startcount | bc`
      pccount_arr[$etid]=$endcount  # count from the beginning
    fi
    twicount=`grep "Start tid:" $pinball.event_icount.$tid.txt | awk '{print $NF}'`
      if [ $use_warmup -eq 1 ];
      then
        wicount_arr[$etid]=$twicount
      else
        wicount_arr[$etid]="0" #No warmup
      fi
    endicount=`grep "End tid:" $pinball.event_icount.$tid.txt | awk '{print $NF}'`
    #icount_arr[$etid]=`echo  $endicount - ${wicount_arr[$etid]} | bc`
    icount_arr[$etid]=$endicount #count from the beginning
  else # No "Sim-End" use "Fini" records
    markercount=`grep -c "Marker"  $pinball.event_icount.$tid.txt`
    if [ $markercount -eq 4 ]; # PC-count with warmup (no Sim-End)
    then
      twpcaddr=`grep "Marker" $pinball.event_icount.$tid.txt | grep tid | head -1 | awk '{print "0x"$2}'`
      if [ $use_warmup -eq 1 ];
      then
        wpcaddr_arr[$etid]=$twpcaddr
      else
        wpcaddr_arr[$etid]="0" #No warmup
      fi
      twpccount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep "tid" |  head -1 | awk '{print $NF}'`
      if [ $use_warmup -eq 1 ];
      then
        wpccount_arr[$etid]=$twpccount
      else
        wpccount_arr[$etid]="0" #No warmup
      fi
      tspcaddr=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  tail -1 | awk '{print "0x"$2}'`
      pcaddr_arr[$etid]=$tspcaddr
      startcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  head -1 | awk '{print $NF}'`
      endcount=`grep -e "Addr " $pinball.event_icount.$tid.txt | grep -e "tid" | tail -1 | awk '{print $NF}'`
      #pccount_arr[$etid]=`echo $endcount - $startcount | bc`
      pccount_arr[$etid]=$endcount  # count from the beginning
    fi
    if [ $markercount -eq 2 ]; # PC-count with no warmup (no Sim-End)
    then
      tspcaddr=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  head -1 | awk '{print "0x"$2}'`
      pcaddr_arr[$etid]=$tspcaddr
      startcount=`grep -e "Marker" $pinball.event_icount.$tid.txt | grep -e "tid" |  head -1 | awk '{print $NF}'`
      endcount=`grep -e "Addr " $pinball.event_icount.$tid.txt | grep -e "tid" | head -1 | awk '{print $NF}'`
      #pccount_arr[$etid]=`echo $endcount - $startcount | bc`
      pccount_arr[$etid]=$endcount  # count from the beginning
    fi
    twicount=`grep "Start tid:" $pinball.event_icount.$tid.txt | awk '{print $NF}'`
      if [ $use_warmup -eq 1 ];
      then
        wicount_arr[$etid]=$twicount
      else
        wicount_arr[$etid]="0" #No warmup
      fi
    endicount=`grep "Fini" $pinball.event_icount.$tid.txt | grep "tid:" | awk '{print $NF}'`
    #icount_arr[$etid]=`echo  $endicount - ${wicount_arr[$etid]} | bc`
    icount_arr[$etid]=$endicount #count from the beginning
  fi
}


SET_ROICOUNTS_NOEVENTS()
{
  pinball=$1
  tid=$2
  etid=$3
  endicount=`grep "inscount" $pinball.$tid.result | awk '{print $NF}'`
  icount_arr[$etid]=$endicount #count from the beginning
}

if  [ $# -lt 2 ];  then
    ERROR
fi
ulimit -s unlimited
    BASE=$1
    prefix=$2
    pinball=$1
    use_warmup=1
    wpb_prefix=""
if  [ $# -eq 3 ];  then
    wpb_prefix=$3
    BASE=$3
fi
    compression=0
    echo $BASE
    FATCHECK $BASE
    basedir=`dirname $BASE`
    basename=`basename $BASE`
# We are not counting threads with 0 icount
    nthreads=`grep inscount $BASE"."*result | awk '{print $NF}' | grep -v -e "^0" | wc -l`
    echo "nthreads $nthreads with non-zero icounts"

# ELFie tids numbering is  reverse of  pinplay tid numbering
# pinplay_tid 0 --> ELFie tid (N-1) 
# Also, we are filtering out threads with 0 icount
#However, this is the 'alt' version of the script where we are using wpb 
# to create a region elfie. At the beginning of that elfie only (pinplay) tid0
# is active and that will be etid0 as well. We therefore do not want to 
# do the tid0-->etid_N-1 mapping.
    pcaddr_arr=()
    wpcaddr_arr=()
    pccount_arr=()
    wpccount_arr=()
    icount_arr=()
    wicount_arr=()
    #nextetid=`echo "$nthreads-1" | bc`
    nextetid=0
    for resultfile in `ls $pinball"."event_icount.*.txt`
    do
      rbasename=`basename $resultfile`
      tid=`echo $rbasename | awk -F "." '{print $(NF-1)}'`
      #ticount=`grep inscount $resultfile | awk '{print $NF}'`
      #if [ $ticount -gt 0 ];
      #then
         etid=$nextetid
         #nextetid=`echo "$nextetid-1" | bc`
         nextetid=`echo "$nextetid+1" | bc`
         pcaddr_arr[$etid]=0
         wpcaddr_arr[$etid]=0
         pccount_arr[$etid]=0
         wpccount_arr[$etid]=0
         icount_arr[$etid]=0
         wicount_arr[$etid]=0 #No warmup
         if [ -e $pinball.event_icount.$tid.txt ];
         then
          SET_ROICOUNTS $pinball $tid $etid
         else
          SET_ROICOUNTS_NOEVENTS $pinball $tid $etid
         fi
      #fi
    done
    let i=0
    pcaddrlist="pcaddr_arr[]={"
    wpcaddrlist="wpcaddr_arr[]={"
    pccountlist="pccount_arr[]={"
    wpccountlist="wpccount_arr[]={"
    icountlist="icount_arr[]={"
    wicountlist="wicount_arr[]={"
    while [ $i -lt $nthreads ];
    do
      if [ $i -gt 0 ];
      then
        pccountlist=$pccountlist", "
        wpccountlist=$wpccountlist", "
        pcaddrlist=$pcaddrlist", "
        wpcaddrlist=$wpcaddrlist", "
        icountlist=$icountlist", "
        wicountlist=$wicountlist", "
      fi
      pccountlist=$pccountlist${pccount_arr[$i]}
      wpccountlist=$wpccountlist${wpccount_arr[$i]}
      pcaddrlist=$pcaddrlist${pcaddr_arr[$i]}
      wpcaddrlist=$wpcaddrlist${wpcaddr_arr[$i]}
      icountlist=$icountlist${icount_arr[$i]}
      wicountlist=$wicountlist${wicount_arr[$i]}
      let i=i+1
    done
      pccountlist=$pccountlist"};"
      wpccountlist=$wpccountlist"};"
      #echo "pccountlist $pccountlist (reverse pinplay-tid order)"
      echo "pccountlist $pccountlist (regular pinplay-tid order)"
      #echo "wpccountlist $wpccountlist (reverse pinplay-tid order)"
      echo "wpccountlist $wpccountlist (regular pinplay-tid order)"
      pcaddrlist=$pcaddrlist"};"
      wpcaddrlist=$wpcaddrlist"};"
      #echo "pcaddrlist $pcaddrlist (reverse pinplay-tid order)"
      echo "pcaddrlist $pcaddrlist (regular pinplay-tid order)"
      #echo "wpcaddrlist $wpcaddrlist (reverse pinplay-tid order)"
      echo "wpcaddrlist $wpcaddrlist (regular pinplay-tid order)"
      icountlist=$icountlist"};"
      wicountlist=$wicountlist"};"
      #echo "icountlist $icountlist (reverse pinplay-tid order)"
      echo "icountlist $icountlist (regular pinplay-tid order)"
      #echo "wicountlist $wicountlist (reverse pinplay-tid order)"
      echo "wicountlist $wicountlist (regular pinplay-tid order)"

    tmpBASE=$BASE
    if test "$( find $basedir -name "$basename*reg.bz2" -print -quit)"
    then
        tmpbasedir="$TMPDIR/$$.pinball"
        tmpBASE="$tmpbasedir/$basename"
        mkdir -p $tmpbasedir
        for regfile in   $BASE*.reg.bz2
        do
          rbasename=`basename $regfile | sed '/.bz2/s///'`
          bunzip2 -c $regfile > $tmpbasedir/$rbasename
        done
        for textfile in  $BASE*.text.bz2
        do
          tbasename=`basename $textfile | sed '/.bz2/s///'`
          bunzip2 -c $textfile > $tmpbasedir/$tbasename
        done
        for otherfile in `ls $basedir | grep -a -v "reg.bz2"| grep -a -v "\.text.bz2" | grep -a -v sysstate`
        do
          obasename=`basename $otherfile`
          srcfile=`readlink -f $basedir/$otherfile`
          cp -rs $srcfile $tmpbasedir/$obasename
        done
        compression=1
    fi

    sysstate=""
    BNAME=`basename $pinball`
    DEST=$pinball.perf.elfie
    if test "$( find $basedir -name "$basename*.sysstate" -print -quit)"
    then
      sysstate=`find $basedir -name "$basename*.sysstate"`
      DEST=$sysstate/$BNAME.perf.elfie
    fi
    cat $INST/perf_callbacks.alt.c | awk -v NTHREADS=$nthreads -v PCCOUNTLIST="$pccountlist" -v WPCCOUNTLIST="$wpccountlist"  -v PCADDRLIST="$pcaddrlist" -v WPCADDRLIST="$wpcaddrlist" -v ICOUNTLIST="$icountlist" -v WICOUNTLIST="$wicountlist" -v PREFIX=$prefix '
     /FILEDECL/ {
        for(i=0; i<=NTHREADS; i++)
        {
          printf "__lte_static char s_fname%d[] = \"%s.%d.perf.txt\";\n",i,PREFIX,i
        }
        printf "\n"
        printf "__lte_static char* my_output_file[] = {"
        for(i=0; i<=NTHREADS; i++)
        {
          printf "s_fname%d",i
          if(i<NTHREADS) printf ", "
        }
        printf "};\n"
        printf "\n"
        printf "#define FILECOUNT %d\n", NTHREADS+1
        printf "__lte_static int out_fd[FILECOUNT];\n"
        printf "__lte_static uint64_t rdtsc_current[FILECOUNT];\n"
        printf "__lte_static uint64_t rdtsc_last[FILECOUNT];\n"
        printf "__lte_static uint64_t rdtsc_begin[FILECOUNT];\n"
        printf "__lte_static uint64_t rdtsc_simbegin[FILECOUNT];\n"
        printf "__lte_static uint64_t %s\n", PCCOUNTLIST
        printf "__lte_static uint64_t %s\n", WPCCOUNTLIST
        printf "__lte_static uint64_t %s\n", PCADDRLIST
        printf "__lte_static uint64_t %s\n", WPCADDRLIST
       printf "__lte_static uint64_t %s\n", ICOUNTLIST
       printf "__lte_static uint64_t %s\n", WICOUNTLIST
        printf "\n"
        next} 
    {print $0}' > $TMPDIR/perf_callbacks.$$.c
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "CWD.log" -print -quit)"
      then
        CWDfile=`find $sysstate -name "CWD.log"`
        echo "CWDFILE $CWDfile"
        CWD=`cat $CWDfile`
        echo "CWD set to $CWD"
      fi
      PREOPEN $sysstate $TMPDIR/perf_callbacks.$$.c
    else
      echo "WARNING: No sysstate directory exists for $BNAME"
      echo "void preopen_files(){}" >>  $TMPDIR/perf_callbacks.$$.c
    fi
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "BRK.log" -print -quit)"
      then
        BRKfile=`find $sysstate -name "BRK.log"`
        echo "BRKFILE $BRKfile"
        SETHEAP $BRKfile $TMPDIR/perf_callbacks.$$.c
      else
        echo "void set_heap(){}" >>  $TMPDIR/perf_callbacks.$$.c
      fi
    else
        echo "void set_heap(){}" >>  $TMPDIR/perf_callbacks.$$.c
    fi
    SETENV $TMPDIR/perf_callbacks.$$.c
    gcc -g -I$PINBALL2ELFLOC/lib -c $TMPDIR/perf_callbacks.$$.c -o $TMPDIR/perf_callbacks.$$.o
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    sscmark2=0x222
set -x
    time  $PINBALL2ELF --text-seg-flags XA --data-seg-flags WXA --cbk-stack-size 1024000 --modify-ldt -u unlimited --roi-start ssc:$sscmark  --roi-start simics:$magicval --magic2 simics:$magicval2 -l 0x0 -i 1 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $DEST -p elfie_on_start -t elfie_on_thread_start -e elfie_on_exit $TMPDIR/perf_callbacks.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
set +x
    cp $TMPDIR/perf_callbacks.$$.c perf_callbacks.c
    rm $TMPDIR/perf_callbacks.$$.c $TMPDIR/perf_callbacks.$$.o
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
