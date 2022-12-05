#!/usr/bin/env bash

# Author: adimascf
# Inputs: data/raw/rrnDB-5.8_16S_rRNA.fasta
#         data/references/silva_seed/silva.seed_v138_1.align
# Outputs: data/references/silva_seed/silva.seed_v138_1.align
#
# We need to include flip=T to make sure all sequences are pointed
# in the same direction


./code/mothur/mothur '#align.seqs(fasta=data/raw/rrnDB-5.8_16S_rRNA.fasta, reference=data/references/silva_seed/silva.seed_v138_1.align, flip=T)'