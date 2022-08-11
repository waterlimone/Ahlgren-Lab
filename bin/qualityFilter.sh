#!/bin/bash -i

## This is our slow step as no mutlithreading is used. Explore the .qza format and get trimmomatic to work.

conda activate qiime2-2022.2 
binDir=$2
cd $1

qiime quality-filter q-score \
--i-demux qiimeRecords/sample_trimmed_joined.qza \
--p-min-quality 28 \
--p-quality-window 4 \
--o-filtered-sequences qiimeRecords/sample_trimmed_joined_quality_filtered.qza \
--o-filter-stats qiimeRecords/quality_filtered_stats.qza