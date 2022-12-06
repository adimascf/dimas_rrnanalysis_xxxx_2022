#!/usr/bin/env bash


# Author: adimascf
# Inputs: none
# Outputs: Places SILVA SEED reference alignment into data/references/silva_seed
#
# Download version 138 of the SILVA reference to help with aligning the sequence data.
# Because the .tgz file contains a README file, we extracted to a directory within 
# data.references/

wget -nc -P data/references https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138_1.tgz
mkdir data/references/silva_seed 
tar -xvzmf data/references/silva.seed_v138_1.tgz -C data/references/silva_seed