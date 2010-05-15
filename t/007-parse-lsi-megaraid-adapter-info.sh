#!/bin/bash

. ../summary

for f in samples/lsi-megaraid-adapter-info*.txt; do
   cp $f /tmp/aspersa;
   parse_lsi_megaraid_adapter_info > /tmp/aspersa-test
   parse_lsi_megaraid_adapter_info
   if diff -q /tmp/aspersa-test ${f/samples/results/}; then
      echo "OK"
   else
      echo "not OK"
      exit 1;
   fi
done
rm -f /tmp/aspersa*
