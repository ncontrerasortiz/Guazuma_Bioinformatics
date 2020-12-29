### Notebook QC report RNA A2

- Title: fastqc and Trimm
- Date: 28-Dic-2020
- Wd: In HPCropDiv /home/ncontrer/projects/rbge/Guazuma/data/processed/RNA

- What/Why: QC and Trim of RNA reads from RBGE living plant A2, Novaseq. Already done by Novogene, but fastqc explained here.
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

- Results: After fastqc the raw reads I noticed that these reads have already been cleaned up and adaptors remove, they have done the QC analysis of reads already. OK!
	1. Fastqc explained when warnings/errors:
			- Per tile seq quality: Shows quality scores from each tile across all the bases to see if there was a loss in quality associated with only one part of the flowcell. Warnings on this plot could be bubbles going through the flowcell.
			- Per base seq content: Expect that there would be little to no difference between the different bases of a sequence run, so the lines in this plot should run parallel with each other. Technical bias shows failure, can't be corrected by trimming and doesn't affect the downstream analysis.
			- Seq Duplication Levels: shows the relative number of sequences with different degrees of duplication.  If peaks persist in the blue trace suggests a large number of different highly duplicated sequences. Reasons: technical duplicates arising from PCR artefacts, or biological duplicates (natural collisions where different copies of exactly the same sequence are randomly selected), not possible to distinguish the two. A warning or error in this module is simply that you have exhausted the diversity in at least part of your library and are re-sequencing the same sequences (wasting sequencing capacity). In RNA-Seq libraries sequences from different transcripts will be present at wildly different levels in the starting population. An examination of the distribution of duplicates in a specific genomic region will allow the distinction between over-sequencing and general technical duplication, but these distinctions are not possible from raw fastq files. 
