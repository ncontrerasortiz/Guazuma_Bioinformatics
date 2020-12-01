# How to run a mafft alingment

1. Script
`#!/bin/bash
#SBATCH --job-name="mafftAln"
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
echo "Starting job on $HOSTNAME"
[Here goes the command with Mafft strategy and output, check doing a test run using '$ mafft']
echo "Job finished"`

	- Example for Strategy G-INS-i, (4) Fasta format / Input order in mafft command: `"/mnt/shared/scratch/ncontrer/apps/conda/bin/mafft"  --globalpair --maxiterate 16 --inputorder "combined_dbqueryhits.fasta" > "comb_dbqueryhits_aln.fasta"`

2. Run script
`sbatch mafftaln.sh`

3. check Job status
`squeue --job [JobID number]`

