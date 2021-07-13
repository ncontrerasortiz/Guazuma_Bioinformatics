#Reciprocal Best Blastn Hits

###BLAST (first using blast 2.5, then blast 2.10)
- Database (subject): NewTargets_Malvaceae (MegaPaftol with Malvaceae)
- Query: T. cacao CDS genome

1. Setting up and organizing the files/folders in `$SCRATCH /private`
- `/blastn_malvNewt_CDS`: dir 
- `malvaceae_targetfile.fasta`: copy from `$APPS /Newtargets`
- `Theobroma_cacaoV2_annot_cds.fasta`: Upload from local
2. Running the analysis using interactive job `$ srun --pty bash`
3. Create database: `malvaceae_targetfile.fasta`
4. Run Blastn: `-evalue 1e-80`following Nicholls et al for better similarity, `-outfmt` 6, 7, 8 and default:
- Output files
		<p>`blastn_malvNewt353_e80_def.out`
		<p>`blastn_malvNewt353_e80_seqaln.out`
		<p>`blastn_malvNewt353_e80_tabcomm.out`
		<p>`blastn_malvNewt353_e80_tab.out`
5. `exit` interactive job
6. Download `blastn_malvNewt353_e80_tab.out` and adding column headings according to How to's in CropHPC for `CropHPC_Blast.md`

7. Running Blast 2.10 again but using `max-target-seq 1` to get ....**Still have to read the paper*** so analysis was just run...as
   #**Atencion! hay que revisar que este analisis esta hecho en el orden que es en cuanto al blast y reciprocal, pero de resto esta bien hecho* Falta revisar resultados bien

- Blast:
 `blastn -db malvaceae_targetfile.fasta  -query Theobroma_cacaoV2_annot_cds.fasta -out blast_NewtargTcacao.outfmt6 -evalue 1e-80 -max_target_seqs 1 -outfmt 6`



###Reciprocal Blast
- Database (subject): T. cacao CDS genome
- Query: NewTargets_Malvaceae 

1. Create directory
- `/blastn_CDS_malvNewt`: create dir
2. Interactive job `$ srun --pty bash`
3. create database with `Theobroma_cacaoV2_annot_cds.fasta`
4. run `blastn`: `-evalue 1e-80`, `-outfmt 6`
- Output file
	<p>`blastn_CDSNewt_e80_tab.out` 
5. `exit` interactive job
6. download file `blastn_CDSNewt_e80_tab.out`

7. running version 2.10

- Reciprocal:
 `blastn -db Theobroma_cacaoV2_annot_cds.fasta -query malvaceae_targetfile.fasta -out blast_NewtargTcacao_reciprocal.outfmt6 -evalue 1e-80 -max_target_seqs 1 -outfmt 6`

###Find RBH
See 02_CropHPC_findRBH

1. Create folder with `outfmt6Blast` and `outfmt6Reciprocal` files

2. Modify Query and DB path in `findRBH.sh`:

4. Output files 
	A. Results from blast 2.5
	- `blast_RBH_summary.txt` and `blast_RBH.txt`

	B. Run again using blast and reciprocal (blastn 2.10)
	- `blast_NewtargTcacao.outfmt6`
	- `blast_NewtargTcacao_reciprocal.outfmt6`
	findRBH
	- `blast_NewtargTcacao_RBH_summary.txt`
	- `blast_NewtargTcacao_RBH.txt`
