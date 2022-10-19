#!/usr/bin/env bash

dir="$1"
threads="$2"
forwardAdapter="$3"
backwardAdapter="$4"

echo "Importing fastq files..."
importQiime.sh "$dir"

echo "Trimming adapters..."
cutadapt.sh "$dir" "$threads" "$forwardAdapter" "$backwardAdapter"

echo "Running dada2"
dada2.sh "$dir" "$threads"

echo "Clustering OTu's with vsearch-cluster"
vsearch-cluster.sh "$dir" "$threads"