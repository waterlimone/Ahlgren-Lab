#!/bin/bash -i


conda activate qiime2-2022.2                     # Activates qiime2 environment
dir=$1                                           # The target directory
binDir=$2                                        # The lab bin directory
threads=$3$                                      # Threads to use


qiime vsearch join-pairs --i-demultiplexed-seqs ${1}/qiimeRecords/sample_trimmed.qza \
--o-joined-sequences ${1}/qiimeRecords/sample_trimmed_joined.qza \
--p-threads 6