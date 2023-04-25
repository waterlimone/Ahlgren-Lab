#!/bin/bash

blastn -query "$1" -db blast_db/ref_nt -out OTU_seqs_vs_red_blastn.txt -evalue 1e-10 -outfmt '6 std qlen slen qcovs'