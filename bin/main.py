#!/usr/bin/env python

# Purpose: To coordinate trimming, denoising, and clusting. Should be the only file called
#          and will become a SLURM job.
#
# Status: Not yet completed

from cutadapt_graph import cutadapt_graph
import os
import sys

def main():

    args = sys.argv                         # System arguments stored in list args.
    readPath = os.path.realpath(args[1])    # The full path of the operational directory is stored here.
    print(readPath) 

    # Import the reads into the qiime .qza archive format.
    os.system("importQiime.sh " + readPath)

    # Cut off the primers/adapters of the samples.
    os.system("cutadapt.sh " + readPath + " " + args[2] + " " + args[3])

    # Join, quality filter, and denoise using dada2.
    os.system("dada2.sh " + readPath + " " + args[1])


    

if __name__ == '__main__':
    main()