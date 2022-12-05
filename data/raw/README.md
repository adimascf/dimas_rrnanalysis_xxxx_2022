# README

Obtained files from [rrDB](https://rrndb.umms.med.umich.edu/static/download/), version 5.8, released in 2022

We automated downloading and extracting the rrnDB files with wget

```
wget -P data/raw/ -nc https://rrndb.umms.med.umich.edu/static/download/rrnDB-5.8.tsv.zip
unzip -n -d data/raw/ data/raw/rrnDB-5.8.tsv.zip

wget -P data/raw/ -nc https://rrndb.umms.med.umich.edu/static/download/rrnDB-5.8_16S_rRNA.fasta.zip
unzip -n -d data/raw/ data/raw/rrnDB-5.8_16S_rRNA.fasta.zip

wget -P data/raw/ -nc https://rrndb.umms.med.umich.edu/static/download/rrnDB-5.8_pantaxa_stats_NCBI.tsv.zip
unzip -n -d data/raw/ data/raw/rrnDB-5.8_pantaxa_stats_NCBI.tsv.zip

wget -P data/raw/ -nc https://rrndb.umms.med.umich.edu/static/download/rrnDB-5.8_pantaxa_stats_RDP.tsv.zip
unzip -n -d data/raw/ data/raw/rrnDB-5.8_pantaxa_stats_RDP.tsv.zip
```
