# README

Donwload [SILVA v138 SEED file](https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138_1.tgz) for alignment and taxonomy


We used `wget`, `mkdir`, and `tar` to download and extract silva seed files to data references silva seed

```
wget -nc -P data/references https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v138_1.tgz
mkdir data/references/silva_seed &&  tar -xvzf data/references/silva.seed_v138_1.tgz -C data/references/silva_seed
```
