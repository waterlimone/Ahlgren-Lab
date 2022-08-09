#!/bin/bash -i


conda activate qiime2-2022.2                     # Activates qiime2 environment
binDir=$2                                        # Bin directory
cd $1                                            # First arg is sample folder.
mkdir cutadapt_trims                             # Creates cutadapt_trims folder

for qual in {22..32}                             # Repeat cutadapt trims for
    do                                           # qual score 22 to 32.

    workingDir=cutadapt_trims/qual${qual}_trimmed  # Working directory is current qual(current qual)_trimed
    mkdir ${workingDir}                          # Makes the directory
    mkdir ${workingDir}/trimmed                  # Makes a the trimmed directory
    mkdir ${workingDir}/trimLog                  # Creates trimLog directory
    mkdir ${workingDir}/qiimeArchives            # Creates archives for the rest of the qiime2 pipeline.

    for item in `ls *R1_001.fastq.gz`   # Loops through every file in directory with
        do                              # Ending R1_001.fastq.gz (only forward reads)

        filestem=`basename $item R1_001.fastq.gz`   # Collects base of forward read file
                                                    # name before R1_001.fastq.gz and puts
                                                    # it in variable filestem

        R1=${filestem}R1_001.fastq.gz # Variable containing full file name for forward read
        R2=${filestem}R2_001.fastq.gz # Variable containing full file name for backward read

        ######################################################################################
        # cutadapt trims the R1 and R2 paired reads with the following options:              #
        #       --no-indels:         Allows only mismatches in alignments                    #
        #       --pair-filter=any:   Either of the paired end reads have to match the filter #
        #                            criteria to be filtered out.                            #
        #       --error-rate:        Maximum allowed error rate *i.e. 0.2 = 20%              #
        #       --discard-untrimmed: Discards reads that do not contain an adapter or primer #
        #       -j: The number of cores to be used                                           #
        #       -q: Trims at the 3' end when bases do not meet the quality score             #
        #       -g: The 5' adapter/primer on the forward read to be removed where ^ means    #
        #           that mismatches are allowed                                              #
        #       -G: The 5' adapter/primer on the backward read to be removed where ^ means   #
        #           that mismatches are allowed                                              #
        #       -o: Specify directory and filename for forward read output                   #
        #       -p: Specify directory and filename for backward read output                  #
        cutadapt --no-indels --pair-filter=any --error-rate=0.2 --discard-untrimmed \
        -j 6 -q $qual --json ${workingDir}/trimLog/${filestem}.json\
        -g ^CGTACTACAATGCTACGG -G ^GGACCTCACCCTTATCAGGG \
        -o ${workingDir}/trimmed/${filestem}R1_001.fastq.gz \
        -p ${workingDir}/trimmed/${filestem}R2_001.fastq.gz $R1 $R2

        qiime tools import --type RWU_SYNITS_0.22filterCells \
        --input-path ${workingDir}/trimmed/${filestem}R1_001.fastq.gz \
        --output-path ${workingDir}/qiimeArchives/${filestem}R1_001.qza

        qiime tools import --type RWU_SYNITS_0.22filterCells \
        --input-path ${workingDir}/trimmed/${filestem}R2_001.fastq.gz \
        --output-path ${workingDir}/qiimeArchives/${filestem}R2_001.qza
    done

    mkdir ${workingDir}/trimmed/fastqc    # Makes the fastqc directory inside of the trimmed directory
    fastqc -t 4 -o ${workingDir}/trimmed/fastqc/ ${workingDir}/trimmed/*fastq.gz # Runs fastqc for every file in the trimmed/
                                                                                 # directory that ends in fastq.gz and
                                                                                 # sends the output to the fastqc/ directory
done

cd $binDir # Moves back to the bin directory for further processing.

conda deactivate # Deactivates qiime2 environment