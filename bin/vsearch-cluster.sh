#!/bin/bash -i

# Clusters the feature table ASVs into OTUs.

# Makes the OTUs directory.
mkdir "$1"/qiimeRecords/dada2/OTUs

# Activates qiime environemnt.
conda activate qiime2-2022.2

# Clusters ASVs into OTUs
 # --i-sequences            | Input feature data sequence data.
 # --i-table                | Input feature table.
 # --p-perc-identity        | The percent identity between reads that needs.
 #                          | to be the same to be considered in the same OTU.
 # --p-threads              | The number of threads to be used.
 # --o-clustered-table      | Path to the OTU feature table.
 # --o-clustered-sequences  | Path to the OTU feature sequences.
qiime vsearch cluster-features-de-novo \
--i-sequences "$1"/qiimeRecords/dada2/sample_representative_sequences.qza \
--i-table "$1"/qiimeRecords/dada2/sample_table.qza \
--p-perc-identity 0.98 \
--p-threads 6 \
--o-clustered-table "$1"/qiimeRecords/dada2/OTUs/"$1"_OTU_table.qza \
--o-clustered-sequences "$1"/qiimeRecords/dada2/OTUs/"$1"_OTU_sequences.qza

qiime tools export --input-path "$1"/qiimeRecords/dada2/OTUs/"$1"_OTU_table.qza --output-path "$1"/qiimeRecords/dada2/OTUs/