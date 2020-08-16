`#!/bin/bash
#SBATCH --job-name="test job"
#SBATCH --export=ALL 
echo "Starting job on $HOSTNAME"
while read LIST; do
$LIST; done < download.txt
echo "Job finished"