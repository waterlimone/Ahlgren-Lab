#!/bin/bash

# Download and run miniconda installer. Installs to the $HOME
curl https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-Linux-x86_64.sh > Miniconda.sh
bash Miniconda.sh -b -p ~/conda
rm Miniconda.sh

# Creates a new line in .bashrc profile and adds conda to the $PATH
echo >> ~/.bashrc
printf "%s" "export \"PATH=\$HOME/conda/bin:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

# Installs mamba a faster conda implementation
conda install -c conda-forge mamba --yes