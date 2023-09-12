#!/bin/bash

target=$1 #either DRAGO2 or DRAGO3
fasta=$2 #sequences
fileType=$(file $fasta)
if [[ $? -ne 0 ]]; then
  echo "Error. The first argument should be drago2/drago3 and the second argument should be a file with sequences in FASTA format." >&2
  exit 1
fi

#check first argument
if [[ $target == "drago2" ]]; then
  url="http://prgdb.org/prgdb/drago2/pipe/"
elif [[ $target == "drago3" ]]; then
  url="http://prgdb.org/prgdb4/drago3/pipe/"
else
  echo "Only drago2/drago3 options are allowed when specifying the first argument."
fi

#check whether the file is compressed or not
if [[ $fileType =~ "ASCII text" ]]; then
  reader="cat"
elif [[ $fileType =~ "gzip compressed data" ]]; then
  reader="zcat"
else
  echo "Unknown format" >&2
  exit 1
fi

#preparing input
temp_file=$(mktemp)
$reader $fasta | awk '{if ($0~/^>/) {gsub(/[^A-Za-z0-9_\.:\-> ]/, "_") ; print $1} else {gsub(/[\* ]/,"") ; print}}' \
| sed $'s/\r//' > $temp_file

cat $temp_file \
| curl -X POST --data-binary @- $url \
| sed 's/\\t/\t/g;s/\\n/\n/g;s/"//g'
RETURN_CODE=$(echo ${PIPESTATUS[@]} | awk '($0~/[1-9]+/)' | wc -l)
if [[ $RETURN_CODE != 0 ]] ; then echo "Curl request failed" >&2 ; exit 1 ; fi
