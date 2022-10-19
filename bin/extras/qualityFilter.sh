#!/bin/bash -i

## $1 is the qiimeRecords folder containing the imported qiime archives.
## $2 is the trimming quality score.
## This is our slow step as no mutlithreading is used. Explore the .qza format and get trimmomatic to work.

conda activate qiime2-2022.2 
qual=$2
cd "$1" || echo ERROR
qualDir="qual${qual}"
mkdir "$qualDir"        # Make a directory containing qual and the quality number that was chosen for this trim I.E. qual28 for a trim of 28.

# --i-demux                 | The archive file to be quality filtered.
# --p-min-quality           | Minimum quality allowed by the quality filter.
# --p-quality-window        | Size of the quality window where quality is averaged. If quality average drops below thresshold then the trimmer 
#                           | will cut at that location.
# --p-min-length-fraction   | If a cut makes the length of the read shorter than the fractional value given then the read will be thrown out.
# --o-filtered-sequences    | Output path to the new archive that has been quality fitlered.
# --o-filter-stats          | Stats file for how many reads passed the trim and other information.
qiime quality-filter q-score \
--i-demux sample_trimmed_joined.qza \
--p-min-quality "$qual" \
--p-quality-window 4 \
--p-min-length-fraction 0.75 \
--o-filtered-sequences "${qualDir}/"sample_trimmed_joined_quality_filtered.qza \
--o-filter-stats "${qualDir}/"quality_filtered_stats.qza