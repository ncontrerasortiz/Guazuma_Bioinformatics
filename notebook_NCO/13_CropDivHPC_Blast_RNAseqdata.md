### Notebook RNA-seq Blast

- Title: RNA-seq Raw reads Blast
- Date: 2-01-2021
- Wd: 
- What/Why: Running Blast+ against a Blast NCBI database and exploring the results.
	1. Raw reads
	2. Assemble transcriptome
- Further docs:
	- See: `code/CropDiversityHPC/01_CropHPS_GeneralUse/06_CropHPC_HowtoRun/HowtorunBlast`
	- Change blast results to several formats `blast_formatter`
	 check: https://codebeautify.org/xmlviewer
------------------------------------------------------------
- Code:
1. Raw reads 1 and 2 separate: so far not possible, need to convert fq.gz file to fasta. Would work with `-remote -db nt`
	1. `blastn -query ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -db ~/../../apps/databases/ncbi/nt.* -out A2_1_nt.txt -max_target_seqs 100 -num_threads 8 -outfmt 11`
 	- `sbatch job_script.sh`
2. Trinity fasta assembly.. running now 3-Dec.20201 12:12m, failed?
	- `blastn -query ~/scratch/private/trinity_out_dir/Trinity.fasta -db nt -out trinity_A2_nt.txt -max_target_seqs 100 -remote -outfmt 11`

	HOW TO MAKE BLAST WITH THE MIRROR DB IN hpc CROPdIVERSITY

---------------------------------------------------------------
- Results:  

