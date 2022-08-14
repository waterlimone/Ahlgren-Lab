#!/bin/bash -i

conda activate qiime2-2022.2

cd "$1" || exit
dirN=$(basename "$1" .qza)_fastqc    # Needs to be in current directory.

mkdir "$dirN"

qiime tools export --input-path "sample_trimmed_joined_quality_filtered.qza" --output-path "$dirN/"
cd "$dirN" || echo "Directory not found"

fastqc ./*fastq.gz
rm ./*fastq.gz ./*fastqc.zip