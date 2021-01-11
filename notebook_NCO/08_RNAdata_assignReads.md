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
- Code and setup:

	1. Fastq_screen folder setup in `/home/ncontrer/scratch/private`
		ftqs_A2/ (FastQScreen_sampleA2)
├── A2_1
│   ├── A2_1_screen.html ...
│   ├── more #second attempt with more genomes
│  		   └── 
		more2
│ 
└── A2_2
    ├── A2_2_screen.html... 
		more #second attempt with more genomes
│ 		   └──
		more2 #attempt with more genomes     

	2. See `job_script.sh` code below

	3. `sbatch --partition=long job_script.sh`

	4. Adding more genomes (first build indexes using bowtie2)
	run fastQ Screen against other plant genomes index:
		- T. cacao
		- Herrania
		- Gossypium
		- Oriza, Zea 


----------------------------------------------------------
- 
- Results in `Genomics/Bioinformatics/data/raw/RNA_Guazuma_RBGE/fastQ_screen`:

1. When ran using databases: Human, Rat, several; many non hits, some to Arabidopsis
2. Next: running again with other plants (not CDS because miss genes that were not previously known/annotated), failed because of a problem with `bowtie2-build`, fixed using sbatch and `--threads X`. See Howtorun/04_FastQ_screen.
3. Repeat 2. but with indexes correctly build: Success!! many reads to Theobroma, Gossypium, Herrania
40% no hits: could be Guazuma specific or just bad reads?
	
- Conclusion: Majority of uniquely mapped hits are in Malvaceaen transcriptomes--> This points towards a Malvacean origin of the sample
	- Proportion of Mult hits/Mult genomes: probable repetitions, Poly As
	- Could say there is any contamination as reads where not observed in any unexpected genome.











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