#!/usr/bin/env bash

# Author: adimascf
# Inputs: name of the file extracted from the archive without the path
# Outputs: Appropiate data raw

target=$1
filename=`echo $target | sed "s/.*\///"`
path=`echo $target | sed -E "s/(.*\/).*/\1/"`

https://rrndb.umms.med.umich.edu/static/download/rrnDB-5.6_16S_rRNA.fasta.zip
wget -P "$path" -nc https://rrndb.umms.med.umich.edu/static/download/"$filename".zip
unzip -n -d "$path" "$target".zip

if [[ $? -eq 0 ]]
then
    touch "$target"
else
    echo "FAIL: we are not able to successfuly extract $filename"
fi