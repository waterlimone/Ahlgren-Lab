#!/bin/bash

# Installs wget for qiime2 install
mamba install wget --yes
sleep 1

# Installs qiime2 as qiime2 env.
mamba env create -n qiime2-2022.2 --file qiime2-2022.2-py38-linux-conda.yml

# Restarts and reloads bash variables into the environment.
conda init bash
exec bash   