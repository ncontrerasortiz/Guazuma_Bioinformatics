
- Notebook **Title: Blast, reciprocal Blast and Rec Best Blast Hits (RBBH) finding**
- Date: Start 16 Oct
- Wd:
	<p>Analysis in CropHPC `$SCRATCH`
	<p>Code description in `code/CropDiversityHPC/04_CropHPC_RBBH`
	<p>Output files in `/exploratory/RBBH/blast1`


- What/Why: Finding orthologs for target selection and further bait design, using Cacao datasets
	1. *blast1*: 
		
		A. db is NewTargets_Malvaceae vs. query is T. cacao CDS genome and the reciprocal (otherway): e value 1-80
		
		B. find RBH using script to get Reciprocal Best Hits list
		
		C. Re-run using blast 2.10 `max-target-seq 1`: Blast will return only the first most significant database hits (blast_NewtargTcacao)

		D. Aligning RBH using mafft


- Code used: 
	- `/code/CropDiversityHPC/04_CropHPC_RBBH/*`: for procedure, how to and scripts
	- `code/CropDiversityHPC/01_CropHPS_GeneralUse/06_CropHPC_HowtoRun/02_CropHPC_Blast.md`: How to run BLAST in cropHPC, How to run Mafft
	- 

- Backups:
		- output files: HPCCropDiversity: mnt/shared/projects/rbge/Guazuma/exploration/RBBH1
		- code Github

- Results:  

	1. Blast results `outfmt6`: from Blast 2.5, retrieving all best hits.
		- Blast: db Newtargets, query TcacaoCDS
			<p>`blastn_malvNewt353_e80_tab.out`
		- Reciprocal: db TcacaoCDS, query Newtargets
			<p>`blastn_CDSNewt_e80_tab.out`


	2. `findRBH.sh` results (see below * ) 

		A. Blast 2.5, retrieving all hits
			- `blast_RBH_summary.txt` and `blast_RBH.txt`
			- Summary:
				<p>queryHits,dbHits,bestHits
				<p>1803,1799,1794

		B. Blast 2.10 using `max-target-seq 1`
			- `blast_NewtargTcacao_RBH_summary.txt`
				<p>queryHits,dbHits,bestHits
				<p>567,1081,335
			- `blast_NewtargTcacao_RBH.txt`: reciprocal best hits list = 335

* A test was done and Blast 2.5 and 2.10 retrieve the same data when not setting # of max seqs to retrieve, i.e. retrieving all the hits. They give same # of RBH at the end.

	3. Extract list of query and db best hits from the big fasta files and align:
		- `dbhits.fasta`: 344 seqs ??? why more??, fixed with extra filtering of duplicates names. Then 335 seqs Ok used
		- `queryhits.fasta`: 335 seqs Ok used

	4. Align sequences using Mafft v7.471
		- Ginsi: global aln
		- Linsi: local aln
		- Linsi: to query (T. cacao)??