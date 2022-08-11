#!/bin/bash -i

conda activate qiime2-2022.2


dirN=$(basename "$1" .qza)_fastqc    # Needs to be in current directory.

mkdir "$dirN"

qiime tools export --input-path "$1" --output-path "$dirN"
cd "$dirN" || echo "Directory not found"

fastqc ./*fastq.gz
rm ./*fastq.gz