#!/bin/bash

. ../summary

for f in samples/dmidecode*.txt; do
   cp $f /tmp/aspersa;
   parse_dmidecode_mem_devices > /tmp/aspersa-test
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK"
   else
      echo "not OK"
   fi
done
rm /tmp/aspersa
