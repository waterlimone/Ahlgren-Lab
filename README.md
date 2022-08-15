- [Installation](#installation)
- [Usage](#usage)



# Installation

1. Open up a linux terminal and clone the repository.
> `git clone https://github.com/waterlimone/Ahlgren-Lab`
2. Navigate to the Ahlgren-Lab Directory.
> `cd Ahlgren-Lab`
3. Launch the installation script.
> `./install.sh`
    - If this doesn't work check file permissions.
4. Wait for the script to finish installing. Then check if qiime2 is installed.
> `conda env list`
    - You should see an environment listed as qiime2.

---
# Usage

1. Have a directory containing fastq.gz files in Casava format.
> Casava format looks like this > `MFM65_S9_L001_R1_001.fastq.gz`
    
    1. MFM65 is the sample name.
    2. S9 is the barcode.
    3. L001 is the sequencer lane number.
    4. R1 or R2 is forward and backward read respectively.
    5. 
    6. fastq.gz is the fastq file extension.

2. Multiple scripts in the ahlgrenEnvironSetup/bin folder should already be in the PATH and ready to use.
    - Further encapsulation will be done to simplify and hide script usage from end user.
