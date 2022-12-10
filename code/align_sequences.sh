#!/usr/bin/env bash

# Author: adimascf
# Inputs: data/raw/rrnDB-5.6_16S_rRNA.fasta
#         data/references/silva_seed/silva.seed_v138_1.align
# Outputs: data/references/silva_seed/silva.seed_v138_1.align
#
# We need to include flip=T to make sure all sequences are pointed
# in the same direction

sed "s/ /_/g" data/raw/rrnDB-5.6_16S_rRNA.fasta > data/raw/rrnDB-5.6_16S_rRNA.temp.fasta

./code/mothur/mothur '#align.seqs(fasta=data/raw/rrnDB-5.6_16S_rRNA.temp.fasta, reference=data/references/silva_seed/silva.seed_v138_1.align, flip=T)'

if [[ $? -eq 0 ]]
then
    mv data/raw/rrnDB-5.6_16S_rRNA.temp.align data/raw/rrnDB-5.6_16S_rRNA.align
    rm data/raw/rrnDB-5.6_16S_rRNA.temp.fasta
else
    echo "FAIL: mothur failed to align sequences"
    exit 1
fi
