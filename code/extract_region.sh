#!/usr/bin/env bash

# Author: adimascf
# Dependency: data/raw/rrnDB-5.8_16S_rRNA.fasta
# Input: the target anem, which is really the output
#       data/<region>/rrnDB.align

target=$1
region=`echo "$target" | sed -E "s/.*\/(.*)\/.*/\1/"`
path=`echo "$target" | sed -E "s/(.*\/.*)\/.*/\1/"`


if [[ "$region" = "v19" ]]
then
    start=1044
    end=43116
    echo "region: $region"

elif [[ "$region" = "v4" ]]
then
    start=13862
    end=23444
    echo "region: $region"

elif [[ "$region" = "v34" ]]
then
    start=6428
    end=23444
    echo "region: $region"

elif [[ "$region" = "v45" ]]
then
    start=13862
    end=27659
    echo "region: $region"

else
    echo "FAIL: we do not have the coordinates for $region"
    exit 1
fi


mkdir -p $path

code/mothur/mothur "#pcr.seqs(fasta=data/raw/rrnDB-5.8_16S_rRNA.align, start=$start, end=$end, outputdir=$path);
filter.seqs(vertical=TRUE)"

# grep -v "^>" $path/rrnDB-5.8_16S_rRNA.pcr.filter.fasta | grep "\."

# If mothur executed sucessfully, then touch the files thaty might not have been
# generated in pcr.seqs because the sequence spanned the desired region's 
# coordinates
if [[ $? -eq 0 ]]
then
    sed '/^[^>]/ s/\./-/g' $path/rrnDB-5.8_16S_rRNA.pcr.filter.fasta > $path/rrnDB-5.8_16S_rRNA.pcr.filter.test.fasta
    

    touch $path/rrnDB-5.8_16S_rRNA.bad.accnos
    touch $path/rrnDB-5.8_16S_rRNA.scrap.pcr.align
else
    echo "FAIL: mothur run into a problem"
    exit 1
fi

TEST=`grep -v "^>" $path/rrnDB-5.8_16S_rRNA.pcr.filter.test.fasta | grep -c "\."`

if [[ $TEST -ne 0 ]]
then
    echo "FAIL: sequences contained periods."
    exit 1
fi


# clean up the file names
mv $path/rrnDB-5.8_16S_rRNA.pcr.filter.test.fasta $target
mv $path/rrnDB-5.8_16S_rRNA.bad.accnos $path/rrnDB.bad.accnos

# garbage collection
rm $path/rrnDB-5.8_16S_rRNA.pcr.align
rm $path/rrnDB-5.8_16S_rRNA.scrap.pcr.align
rm $path/rrnDB-5.filter
rm $path/rrnDB-5.8_16S_rRNA.pcr.filter.fasta







