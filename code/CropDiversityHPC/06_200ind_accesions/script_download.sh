#!/bin/bash
#SBATCH --job-name="download200_ind"
#SBATCH --export=ALL 
while read LIST; do
$LIST; done < download.txt