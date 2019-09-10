#!/usr/bin/perl

BEGIN {
 use File::Basename;
 push(@INC,dirname($0));
}

use Getopt::Long;
use File::Spec::Functions qw(catdir catfile);
use File::Basename qw(fileparse basename dirname);
use Data::Dumper;
use Cwd qw(cwd abs_path);
use integer;
use Fcntl;

sub cvtfile
{
  my $fname = shift;
  my $start_addr;
  my $end_addr;
  my $instr_len_max = 0;

  open(FH,"< $fname") or die "Couldn't open $fname: $!\n";
  while(my $s = <FH>)
  {
    #  4000bc:	49 bc 53 04 40 00 00 	movabs $0x400453,%r12
    if($s =~ /^\s+([a-fA-F\d]+)\:(.*)/)
    {
      my $instr_addr = $1;
      my $instr_len = 0;
      my @opcodes = split(' ', $2);

      if(!defined $start_addr)
      {
         $start_addr = $instr_addr;
      }
      $end_addr = $instr_addr;

      for my $o (@opcodes)
      {
         if($o =~ /^[a-fA-F\d][a-fA-F\d]$/)
         {
           $instr_len++;
         }
         else
         {
            last;
         }
      }
      $instr_len_max = $instr_len if($instr_len > $instr_len_max);
    }
  }

  seek(FH, 0, SEEK_SET);

  my $fmt = sprintf("%%%dx", length(sprintf("%x", hex($end_addr)-hex($start_addr))));

  while(my $s = <FH>)
  {
    if($s =~ /^\s+([a-fA-F\d]+)\:(.*)/)
    {
      my $instr_addr = $1;
      my @v = split(' ', $2);

      $instr_addr = sprintf($fmt, hex($instr_addr)-hex($start_addr));
      print " /*$instr_addr*/";

      my $item;
      my $i = 0;
      while (defined($item = shift @v))
      {
        if($item =~ /^[a-fA-F\d][a-fA-F\d]$/)
        {
          print " 0x$item,";
          $i++;
        }
        else
        {
          for(; $i < $instr_len_max; $i++)
          {
             print "      ";
          }

          my $s = join(' ', @v);
          print " //$item $s";
          last;
        }
      }
      print "\n";
    }
    else
    {
      last if($s =~ /^\s*[a-fA-F\d]+\s+\<trace.start\>\:/);
      print "//$1\n" if($s =~ /^\s*[a-fA-F\d]+\s+(\<.*\>\:)/);
    }
  }
  close(FH);
}

cvtfile(@ARGV) if((0+@ARGV) > 0);
1;
