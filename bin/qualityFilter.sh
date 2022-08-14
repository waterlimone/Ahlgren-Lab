#!/bin/bash -i

## This is our slow step as no mutlithreading is used. Explore the .qza format and get trimmomatic to work.

conda activate qiime2-2022.2 
qual=$2
cd "$1" || echo ERROR
qualDir="qual${qual}"
mkdir "$qualDir"

qiime quality-filter q-score \
--i-demux sample_trimmed_joined.qza \
--p-min-quality "$qual" \
--p-quality-window 4 \
--o-filtered-sequences "${qualDir}/"sample_trimmed_joined_quality_filtered.qza \
--o-filter-stats "${qualDir}/"quality_filtered_stats.qza