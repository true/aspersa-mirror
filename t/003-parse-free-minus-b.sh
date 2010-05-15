#!/bin/bash

. ../summary

for f in samples/free_minus_b*.txt; do
   cp $f /tmp/aspersa;
   parse_free_minus_b > /tmp/aspersa-test
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK"
   else
      echo "not OK"
   fi
done
rm /tmp/aspersa
