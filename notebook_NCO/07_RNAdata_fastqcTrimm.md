### Notebook Fastqc and Trimm

- Title: fastqc and Trimm
- Date: 28-Dic-2020
- Wd: In HPCropDiv /home/ncontrer/projects/rbge/Guazuma/data/processed/RNA

- What/Why: QC and Trim of RNA reads from RBGE living plant, Novaseq
- Further docs: QC_trimm_map_varients_commands.txt from CK practical
- Code: 

1. **FASTQC**
	1. Run Fastqc in raw reads A2, using HPC Crop script `fastqc.sh`
		- Script
			`
			#!/bin/bash
			#SBATCH --job-name="fastqc rawreads"
			#SBATCH --export=ALL 
			#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
			#SBATCH --mail-type=END,FAIL
			fastqc ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/X204SC20113077-Z01-F001/raw_data/A2/A2_*.fq.gz
			echo "Job finished"
			`
		- Run: `sbatch fastqc.sh`
		- job status: `squeue --job 475162`
	2. download and check fastqc report

2. **TRIMMOMATIC**
- Results:  
