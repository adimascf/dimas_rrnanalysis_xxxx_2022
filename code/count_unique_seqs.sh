#!/usr/bin/env bash


TARGET=$1 #data/v19/rrnDB.unique.align

STUB=`echo $TARGET | sed -E "s/(.*rrnDB).*/\1/"` 
STUB_TEMP=$STUB.temp
ALIGN=$STUB.align
TEMP_ALIGN=$STUB_TEMP.align
TEMP_GROUPS=$STUB_TEMP.groups


sed -E "s/>.*\|(.*)\|(.*)\|.*\|(.*)_.$/>\1\|\2\|\3/" $ALIGN > $TEMP_ALIGN

grep "^>" $TEMP_ALIGN | sed -E "s/>((.*)\|.*\|.*)/\1 \2/" > $TEMP_GROUPS

./code/mothur/mothur "#unique.seqs(fasta=$TEMP_ALIGN, format=name); count.seqs(group=$TEMP_GROUPS, compress=f)"
./code/mothur/mothur "#count.seqs(count=$STUB_TEMP.count_table, compress=f)"

mv $STUB_TEMP.unique.align $STUB.unique.align
mv $STUB_TEMP.full.count_table $STUB.count_table

rm $STUB_TEMP.names
rm $STUB_TEMP.groups
rm $STUB_TEMP.align
rm $STUB_TEMP.count_table
