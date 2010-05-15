#!/bin/bash

. ../summary

for f in samples/free_minus_b*.txt; do
   cp $f /tmp/aspersa;
   parse_free_minus_b > /tmp/aspersa-test
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK $f"
   else
      echo "not OK $f"
      exit 1;
   fi
done
rm -f /tmp/aspersa*
