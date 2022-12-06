#!/usr/bin/env bash

# Author: adimascf
# Inputs: name of the file extracted from the archive without the path
# Outputs: Appropiate data raw

target=$1
filename=`echo $target | sed "s/.*\///"`
path=`echo $target | sed -E "s/(.*\/).*/\1/"`

wget -P "$path" -nc https://rrndb.umms.med.umich.edu/static/download/"$filename".zip
unzip -n -d "$path" "$target".zip

touch "$target"