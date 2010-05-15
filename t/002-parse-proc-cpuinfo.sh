#!/bin/bash

. ../summary

for f in samples/proc_cpuinfo_*.txt; do
   cp $f /tmp/aspersa;
   parse_proc_cpuinfo > /tmp/aspersa-test
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK $f"
   else
      echo "not OK $f"
      exit 1;
   fi
done
rm -f /tmp/aspersa*
