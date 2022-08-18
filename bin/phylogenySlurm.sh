#!/bin/bash -i

#SBATCH --nodes=1
#SBATCH --time=0-00:30:00
#SBATCH --partition=short-cpu
#SBATCH --job-name=Qiime2
#SBATCH --output=phylogeny.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cmcilvenna@clarku.edu

conda activate qiime2-2022.2
qiime phylogeny align-to-tree-mafft-fasttree --i-sequences representative_sequences.qza --output-dir tree --p-n-threads auto