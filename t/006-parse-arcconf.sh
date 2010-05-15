#!/bin/bash

. ../summary

for f in samples/arcconf*.txt; do
   cp $f /tmp/aspersa;
   parse_arcconf > /tmp/aspersa-test
   parse_arcconf
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK"
   else
      echo "not OK"
   fi
done
rm /tmp/aspersa
