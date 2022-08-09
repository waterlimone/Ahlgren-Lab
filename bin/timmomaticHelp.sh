#!/bin/bash -i

conda activate qiime2-2022.2                     # Activates qiime2 environment
binDir=$2
cd $1
mkdir trimmomatic_trims
cd trimmomatic_trims

