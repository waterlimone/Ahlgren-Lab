#!/bin/bash -i

conda activate qiime2-2022.2 
binDir=$2
cd $1

mkdir reads
mv *fastq.gz reads/

mkdir qiimeRecords
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path reads/ \
--input-format CasavaOneEightSingleLanePerSampleDirFmt \
--output-path qiimeRecords/sample.qza