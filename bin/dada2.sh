#!/usr/bin/env -S bash -i

conda activate qiime2-2022.2

# Make a directory dada2 in the directory $1
mkdir "$1"/qiimeRecords/dada2

# Join, quality filter, and denoise.
  # --p-trun-lenc       | Truncation on the 3' end of the forward read.
  # --p-trunc-len       | Truncation on the 5' end of the backward read.
  # --o-table           | Output path for feature table.
  # --o-representative..| Sequence file output.
  # --o-denoising-stats | Path to denoising stats file.
qiime dada2 denoise-paired --i-demultiplexed-seqs "$1"/qiimeRecords/sample_trimmed.qza \
--p-trunc-len-f 0 \
--p-trunc-len-r 0 \
--p-n-threads "$2" \
--o-table "$1"/qiimeRecords/dada2/sample_table.qza \
--o-representative-sequences "$1"/qiimeRecords/dada2/sample_representative_sequences.qza \
--o-denoising-stats "$1"/qiimeRecords/dada2/sample_denoising_stats.qza