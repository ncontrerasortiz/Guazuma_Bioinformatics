#!/bin/bash
#SBATCH --job-name="test job"
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
echo "Starting job on $HOSTNAME"
[here goes the command]
echo "Job finished"