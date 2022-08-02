#!/usr/bin/env python

from cutadapt_graph import cutadapt_graph
import os
import sys

def main():

    args = sys.argv
    cutadapt_dir = os.path.realpath(args[1])
    cutadapt_graph(cutadapt_dir, args[1])
    # try:
        
    # except:
    #     print("Error: First argument has to be a directory.")
   

if __name__ == '__main__':
    main()