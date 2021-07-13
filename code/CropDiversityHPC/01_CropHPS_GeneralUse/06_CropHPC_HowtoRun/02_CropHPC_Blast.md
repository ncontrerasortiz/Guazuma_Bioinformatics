# Blast

###General commands to run **Blastn**
*If using CropDiversityHPC*:
<br>Run in directory `$SCRATCH`
<br>Using interactive job to run blastn `$ srun --pty bash`

##Running Blast+ using a custom database
- Query: The sequence of interest where we want to find the homologs
- Subject: Database containing many other sequences
- Search of a nucleotide query against the database (subject)

1. Create database (subject)
<p>`makeblastdb -in subject_file.fasta -dbtype nucl`
2. Perform Blastn. Change [] with filename or specific value

`blastn -db [subject_file.fasta] -query [query_file.fasta] -out [blastn_file_evalX_fmt.out] -evalue [1e-80] -outfmt [#]`

- `out`: change output name accordingly with output format specified in outfmt.
- `evalue`: change accordingly. 1e-80 is very specific (Nicholls et al).
- `outfmt`: different formats for output, change output file ending
	<p>6 = Tabular `tab.out`
	<p>7 = Tabular with comment lines `tabcomm.out`
	<p>8 = Seqalign (Text ASN.1) `seqaln.out`
	<p>def = default, for this don't include `-outfmt` command `def.out`

	 
	 

3. Download the files from CropHPC
`scp -r ncontrer@gruffalo.cropdiversity.ac.uk:/mnt/shared/scratch/ncontrer/private/... /home/naco`

4. BLASTn tabular output format 6

- Column headers:
<p>qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore

 1. qseqid: query (e.g., unknown gene) sequence id
 2.	sseqid: subject (e.g., reference genome) sequence id
 3. pident: percentage of identical matches
 4. length: alignment length (sequence overlap)
 5. mismatch: number of mismatches
 6. gapopen: number of gap openings
 7. qstart: start of alignment in query
 8. qend: end of alignment in query
 9. sstart: start of alignment in subject
 10. send: end of alignment in subject
 11. evalue: expect value
 12. bitscore: bit score

5. Updating Blast to newest version (above 2.8 for bug fixing see https://academic.oup.com/bioinformatics/article/35/15/2699/5259186)
- Check current version: `conda list`
- remove old Blast: `conda remove blast` and `conda clean`
- install newest available version: `conda install blast=2.10.1`

6. Extra Options
   1. Running blast with `-max_target_seqs N` (only for Blast above 2.8): number of align seqs to keep. Blast will return only N most significant database hits.
	- `max_target_seqs X` Maximum number of aligned sequences to keep, because default is 500. Blast returns X number of sequences (subject) matchs. Shortcut to reduce # of Blast results

   2. `-db_soft_mask`: Filtering algorithm ID to apply to the BLAST database as soft masking following Moreno-Hagelsieb et al 2007. This options allows for more orthologs matches compare to the default (hard masking).
   			- Requires  user to provide the masking data `-mask_data` when using `makeblastdb`
            - To enable database masking during a BLAST search, use the -info parameter of `blastdbcmd` to discover the masking Algorithm ID: `blastdbcmd -db [database.fasta] -dbtype nucl -info`
  3. `-subject_besthit` Turn on best hit per subject sequence. Este no lo use porque seria best hit pero en el subject no en el query que es lo que necesito.  culls HSPs on a per subject sequence basis by removing HSPs that are completely enveloped by another HSP. This is an experimental option and is subject to change.
            
##Running Blast+ using NCBI database
1.