### Notebook Template for task overview

- Title:
- Date:
- Wd:
- What/Why:
- Further docs:
- Code: what code used and where is it
- Results:  

# Fast cmds

Run interactive Job:
 srun --pty bash

Gruffalo to local
 $ scp -r ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/X204SC20113077-Z01-F001/raw_data/Rawdata_Readme.pdf .

 Github
 git add .
 git commit -m "message"


# Current work
- 28 Dec 2020
Fastqc raw reads A2
1. TRinity assembly
	1. Trinity assembly
	2. then bowtie of reads to transcriptome to asses level of expression
2. Bowtie

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
