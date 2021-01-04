### Notebook Assign RNA-seq reads reads
- Title: Assign RNA-seq reads reads
- Date: 3 - Jan - 2021
- Wd: 
- What/Why: Screen reads, classify and explore composition of the library to see if it matches expect organisms.
- Further docs:
	- [FastQ Screen](https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/)
	- See Howtorun FastQ_screen.md for pre-install

	- Other options to mayybe try
		- [Kraken](https://ccb.jhu.edu/software/kraken/)
		- [Kaiju](https://github.com/bioinformatics-centre/kaiju)
		- [Decontaminer](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-019-2684-x)
--------------------------------------------------------------
- Code:

	1. Fastq_screen folder setup in `/home/ncontrer/scratch/private`
		ftqs_A2/ (FastQScreen_sampleA2)
	├── A2_1: raw reads 1
	└── A2_2: raw reads 2

	2. `sbatch --partition=long job_script.sh`

Next: run fastQ Screen against NCBI data bases! Angiosperms or something like that
--------------------------------------------------------------
- Results:













--------------------------------------------------------------
- Extras
	- job_script.sh:<br>
	`#!/bin/bash
#SBATCH --job-name="fastq_screen A2_2"
#SBATCH --cpus-per-task=20
#SBATCH --mem=6G
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
fastq_screen --aligner bowtie2 --threads 10 --conf /home/ncontrer/scratch/apps/FastQ_Screen_db/FastQ_Screen_Genomes/fastq_screen.conf ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz
echo "Job finished"
	`
