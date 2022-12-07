#!/usr/bin/env bash

# Author: adimascf
# Inputs: none
# Outputs: mothur installed in code/mothur

# The zip archive contains a directory called mothur
# so we can extract directly 
unzip -n -d data/raw/ data/raw/$archive.zip

wget -P code/mothur/ -nc https://github.com/mothur/mothur/releases/download/v1.48.0/Mothur.Ubuntu_20.zip
unzip -n -d code/ code/mothur/Mothur.Ubuntu_20.zip

if [[ $? -eq 0 ]]
then
    touch code/mothur/mothur
else
    echo "FAIL: we are not able to successfuly install mothur"
fi