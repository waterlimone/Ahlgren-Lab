#!/bin/bash -i

# Imports the fastq.gz files to the qiime .qza archive format.

conda activate qiime2-2022.2 

# Makes and moves the fastq.gz files into the reads folder.
mkdir "$1"/reads
mv "$1"/*R1*fastq.gz "$1"/reads/

# Makes the qiimeRecords directory and imports the paired sequence data
# to qiimeRecords/sample.qza
mkdir "$1"/qiimeRecords
qiime tools import --type 'SampleData[SequencesWithQuality]' \
--input-path "$1"/reads/ \
--input-format CasavaOneEightSingleLanePerSampleDirFmt \
--output-path "$1"/qiimeRecords/sample.qza