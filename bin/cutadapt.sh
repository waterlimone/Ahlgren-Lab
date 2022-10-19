#!/usr/bin/env -S bash -i

# Cuts off the primers/adapters of the samples.

# Activates the conda environment.
conda activate qiime2-2022.2 

# Cut off the primers/adapters.
 # --i-demultiplexed-sequences  | Input sequence files after import.
 # --o-trimmed-sequences        | Output of the trimmed sequences.
 # --p-cores                    | Number of cores to be used.
 # --p-front-f                  | Forward primer/adapter to be trimmed.
 # --p-front-r                  | Reverse primer/adapter to be trimmed.
 # --p-error-rate               | Allowed percentage error off of the 
 #                              | primer/adapter to be matched and trimmed.
 # --p-no-indels                | Doesn't allow indels in the primer/adapter.              
qiime cutadapt trim-paired \
--i-demultiplexed-sequences "$1"/qiimeRecords/sample.qza \
--o-trimmed-sequences "$1"/qiimeRecords/sample_trimmed.qza \
--p-cores "$2" \
--p-front-f ^"$3" \
--p-front-r ^"$4" \
--p-error-rate 0.2 \
--p-no-indels

# --p-front-f ^CGTACTACAATGCTACGG \
# --p-front-r ^GGACCTCACCCTTATCAGGG \