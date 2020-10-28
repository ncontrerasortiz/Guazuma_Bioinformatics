
- **Title: Blast, reciprocal Blast and Rec Best Blast Hits (RBBH) finding**
- Date: Start 16 Oct
- Wd:
	<p>Analysis in CropHPC `$SCRATCH`
	<p>Code description in `code/CropDiversityHPC/04_CropHPC_RBBH`
	<p>Output files in `/exploratory/RBBH/blast1`


- What/Why: Finding orthologs for target selection and further bait design, using Cacao datasets
	1. *blast1*: 
		a. db is NewTargets_Malvaceae vs. query is T. cacao CDS genome and the reciprocal (otherway): e value 1-80
		b. find RBH using script

- Further docs:

- Code used: 
	<p>`/code/CropDiversityHPC/04_CropHPC_RBBH/*`: for procedure, how to and scripts
	<p>`code/CropDiversityHPC/01_CropHPS_GeneralUse/06_CropHPC_HowtoRun/02_CropHPC_Blast.md`: How to run BLAST in cropHPC

- Results:  In `/exploratory/RBBH/blast1` 
	1. Blast results `outfmt6`
	- Blast: db Newtargets, query TcacaoCDS
	<p>`blastn_malvNewt353_e80_tab.out`
	- Reciprocal: db TcacaoCDS, query Newtargets
	<p>`blastn_CDSNewt_e80_tab.out`

	2. `findRBH.sh` results are `blast_RBH_summary.txt` and `blast_RBH.txt`
	- Summary:
	<p>queryHits,dbHits,bestHits
	<p>1803,1799,1794