### Notebook Template for task overview

- Title:
- Date:
- Wd:
- What/Why:
- Further docs:
--------------------------------------------------------------
- Code and setup: what code used and where is it
--------------------------------------------------------------
- Results:  

--------------------------------------------------------------
- Extras

# Fast cmds

Run interactive Job:
 srun --pty bash
 sbatch --partition=long job_script.sh (for more than 24 hr)
 squeue --job

Gruffalo to local
 $ scp -r ncontrer@gruffalo.cropdiversity.ac.uk: .
 rsync -avP ncontrer@gruffalo.cropdiversity.ac.uk: .

 Github
 git add .
 git commit -m "message"

Slurm
hela 64 CPUs count=(2CPUx16coresx2Threads)

# Current work
Transcriptome Assembly
1. Trinity assembly
	1. Trinity assembly ok
	2. Trinity Assembly quality assesment
		- RNA-seq reads representation: OK
		- Representation of full-length protein coding: Revisar resultados y entender (NEXT)
		- TransRate: see if read mapping is similar to RNA-seq read reprs as before. Analyse contig and comparative metrics results
    -NEXT: understand results from all this!
    and Blast the subset of Nohits from fastqscreen
    - rnaQaust next
    - Busco

    - Transcriptome Contig Nx and ExN50 stats:*Currently March 2021*

2. Then do blastx of no hits reads of fastqscreen
	2. then bowtie of reads to transcriptome to asses level of expression
2. Bowtie






Stopped when RNA data arrived (Dec 20 2020)
- Oct 2020: RBBH (recip best blast hit) T. cacao vs. paftol in crop diversity
	- download paftol filtered data: install ok, download ok, running scripts ok
	- do the blast: Select query etc ok
	- do reciprocal blast ok
	- find RBH using script OK
	- Re run OK Blast using max-target-seq 1 and findRBH
	- Pull out the sequences into separate files Ok

	AQUI VOY

	- aligning using local (linsi* seems more suited for this) and global Ginsi in mafft: Entender cuále es mejor o peor.. parece que Linsi sería mejor según (https://academic.oup.com/mbe/article/33/7/1875/2579186) Considerar usar Mr bait o Baitfisher?

	- Tratar de entender como lo hacen Nicholls et al...

	- consider re-running the analysis without max-target-seq 1
next git commit -m "database of"
next git commit -m "aligning RBH sequences using mafft"



- script

#!/bin/bash
#SBATCH --job-name="fastq_screen test configuration"
#SBATCH --cpus-per-task=8
#SBATCH --mem=6G
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
fastq_screen --aligner bowtie2 --threads 4 --conf fastq_screen_test.conf fqs_test_dataset.fastq.gz
echo "Job finished"
