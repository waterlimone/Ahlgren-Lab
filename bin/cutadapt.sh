#!/bin/bash -i

conda activate qiime2-2022.2 
binDir=$2
cd $1

qiime cutadapt trim-paired \
--i-demultiplexed-sequences qiimeRecords/sample.qza \
--o-trimmed-sequences qiimeRecords/sample_trimmed.qza \
--p-cores 4 \
--p-front-f ^CGTACTACAATGCTACGG \
--p-front-r ^GGACCTCACCCTTATCAGGG \
--p-error-rate 0.2 \
--p-no-indels --verbose