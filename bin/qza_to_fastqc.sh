#!/bin/bash -i

conda activate qiime2-2022.2

cd "$1" || exit                      # Change to the directory containing already quality trimmed archives I.E. qual28 etc..
dirN=$(basename "$1" .qza)_fastqc    # Needs to be in current directory.

mkdir "$dirN"                        # Makes a directory for the fastqc files.

# Exports the fastq files from the qiime archive for fastqc to use.
qiime tools export --input-path "sample_trimmed_joined_quality_filtered.qza" --output-path "$dirN/"

# Move into fastqc folder
cd "$dirN" || echo "Directory not found"

fastqc ./*fastq.gz                    # Use fastqc on all of the fastq.gz archived files.
rm ./*fastq.gz ./*fastqc.zip          # Remove all of the residual fastq.gz and fastqc.zip folder and only leave html readouts of fastqc.