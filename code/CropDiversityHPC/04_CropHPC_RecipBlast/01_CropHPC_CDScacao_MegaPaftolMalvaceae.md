#Blastn



##Database (subject): NewTargets_Malvaceae
##Query: T. cacao CDS genome


1. Setting up and organizing the files/folders in `$SCRATCH /private`
- `/blastn_malvNewt_CDS`: dir 
- `malvaceae_targetfile.fasta`: copy from `$APPS /Newtargets`
- `Theobroma_cacaoV2_annot_cds.fasta`: Upload from local
2. Running the analysis using interactive job `$ srun --pty bash`
3. Create database: `malvaceae_targetfile.fasta`
4. Run Blastn: `-evalue 1e-80`following Nicholls et al for better similarity, `-outfmt` 6, 7, 8 and default:
		<p>`blastn_malvNewt353_e80_def.out`
		<p>`blastn_malvNewt353_e80_seqaln.out`
		<p>`blastn_malvNewt353_e80_tabcomm.out`
		<p>`blastn_malvNewt353_e80_tab.out`
5. `exit` interactive job
6. Download `blastn_malvNewt353_e80_tab.out` and adding column headings according to How to's in CropHPC for `CropHPC_Blast.md`


###Reciprocal Blast
<p>Database (subject): T. cacao CDS genome
<p>Query: NewTargets_Malvaceae 

1. Create directory
- `/blastn_CDS_malvNewt`: create dir
2. Interactive job `$ srun --pty bash`
3. create database with `Theobroma_cacaoV2_annot_cds.fasta`
4. run `blastn`: `-evalue 1e-80`, `-outfmt 6`
	<p>`blastn_CDSNewt_e80_tab.out` 
5. `exit` interactive job
6. download file `blastn_CDSNewt_e80_tab.out`
