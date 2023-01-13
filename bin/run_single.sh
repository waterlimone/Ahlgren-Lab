#!/usr/bin/env bash

dir="$1"
threads="$2"
forwardAdapter="$3"

echo "Importing fastq files..."
importQiime_single.sh "$dir"

echo "Trimming adapters..."
cutadapt_single.sh "$dir" "$threads" "$forwardAdapter"

echo "Running dada2"
dada2_single.sh "$dir" "$threads"

echo "Clustering OTu's with vsearch-cluster"
vsearch-cluster.sh "$dir" "$threads"