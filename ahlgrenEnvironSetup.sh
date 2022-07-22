#!/bin/bash

# Download and run miniconda installer. Installs to the $HOME
curl https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh > Miniconda.sh
bash Miniconda.sh -b -p ~/conda
rm Miniconda.sh

# Creates a new line in .bashrc profile and adds conda to the $PATH
echo >> ~/.bashrc
echo PATH="$HOME/conda/bin:$PATH" >> ~/.bashrc

# Installs mamba a faster conda implementation
conda install -c conda-forge mamba --yes

# Installs wget for qiime2 install
mamba install wget --yes

# Installs qiime2 as qiime2 env.
mamba env create -n qiime2-2022.2 --file qiime2-2022.2-py38-linux-conda.yml

conda init bash
bash