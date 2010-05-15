#!/bin/bash

. ../summary

for f in samples/group-concat-*.txt; do
   group_concat $f tempresult
   echo "${tempresult}" > /tmp/aspersa-test
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK $f"
   else
      echo "not OK $f"
      exit 1;
   fi
done
rm -f /tmp/aspersa*
