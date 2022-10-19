#!/bin/bash -i

#SBATCH --nodes=1
#SBATCH --time=0-00:30:00
#SBATCH --partition=short-bigmem
#SBATCH --job-name=Qiime2
#SBATCH --output=heatmap.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=cmcilvenna@clarku.edu


conda activate qiime2-2022.2
qiime feature-table heatmap --i-table feature_table.qza --output-dir heatmap