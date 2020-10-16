
- **Title: Reciprocal Best Blast Hits (RBBH) for ortholog finding**
- Date: Start 16 Oct
- Wd:
	<p>Analysis in CropHPC `$SCRATCH`
	<p>Output files in `/exploratory/RecipBestBlastHits/blast1`:

- What/Why: Finding orthologs for target selection and further bait design, using Cacao datasets
	1. blast1: db is NewTargets_Malvaceae vs. query is T. cacao CDS genome and the reciprocal (otherway)

- Further docs:

- Code: 
	<p>`/Bioinformatics/code/CropDiversityHPC/04_CropHPC_RecipBlast/01_CropHPC_CDScacao_MegaPaftolMalvaceae.md`: for procedure
	<p>`code/CropDiversityHPC/01_CropHPS_GeneralUse/06_CropHPC_HowtoRun/02_CropHPC_Blast.md`: How to run blast in cropHPC

- Results:  
<p>In `/exploratory/RecipBestBlastHits/blast1` selecting BBH:
	<p>`blastn_malvNewt353_e80_tab`:db Newtargets, query TcacaoCDS
	<p>`blastn_CDSNewt_e80_tab`: db TcacaoCDS, query Newtargets
