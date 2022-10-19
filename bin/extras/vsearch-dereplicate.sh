#!/bin/bash

cd "$1"/qiimeRecords || exit

qiime vsearch dereplicate-sequences \
--i-sequences sample_trimmed_joined_quality_filtered.qza \
--output-dir featureTable/
