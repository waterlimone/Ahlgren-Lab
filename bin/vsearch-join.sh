#!/bin/bash -i


conda activate qiime2-2022.2                     # Activates qiime2 environment
# binDir=$2
# cd $1
mkdir joined-pairs

for item in `ls cutadapt_trims/qual${1}_trimmed/trimmed/*R1_001.fastq.gz`
    do

    filestem=`basename $item R1_001.fastq.gz`   # Collects base of forward read file
    echo $filestem

    R1=${filestem}R1_001.fastq.gz               # Variable containing full file name for forward read
    R2=${filestem}R2_001.fastq.gz               # Variable containing full file name for backward read
done

conda deactivate # Deactivates qiime2 environment