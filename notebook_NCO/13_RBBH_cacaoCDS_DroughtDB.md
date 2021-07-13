## RBBH DroughtDB

- Title: Reciprocal Best Blast Hit DroughtDB against Malvaceae genomes
- Date: 12 July 2021
- Wd: `HPCrop /home/ncontrer/scratch/private/RBBH_2`
- What/Why: Find orthologous genes of DroughtDB in the T. cacao CDS annotated genome. Then this orthologous will be mapped in the Guazuam transcriptome (in other notebook)
- Further docs: [RBBH protocol] (https://morphoscape.wordpress.com/2020/08/18/reciprocal-best-hits-blast-rbhb/), [Choosing BLAST options for better detection of orthologs as reciprocal best hits](https://academic.oup.com/bioinformatics/article/24/3/319/252715)

------------------------------------ Code and setup

### Theobroma cacao
- Query: T. cacao CDS
- Subject: DroughtDB  

- Files in CropHPC  
    ├── 1blastn_cacao_Drought: **Blast** Cacao query against subject database  
    ├── 2blastn__Drought_cacao: Reciprocal  
    ├── 3findRBH: Find best Hits Using script (see Extras, not added yet)  

*Interactive job `$ srun --pty bash`*
#### Blast  
1. Make blastable database
    1. 1`makeblastdb -in completeCDS_DroughtDB_194Seqs.fasta -dbtype nucl`  
        - 194 sequences; 254,699 total bases

    1.2 `cp Theobroma_cacaoV2_annot_cds.fasta .`
2. Blastn
   `blastn -db completeCDS_DroughtDB_194Seqs.fasta -query Theobroma_cacaoV2_annot_cds.fasta -out blastn_cacaoDrought.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8`  

   Search a nucleotide query, T. cacao CDS (`-query`), with the megablast algorithm (`-task megablast`, default) against the database DroughtDB_194 (`-db`). Keep a maximum of 5 aligned sequences matches from the database (`max_target_seqs`).  Set the result format to tabular output (`-outfmt 6`), to a file named blastn_cacaoDrought.outfmt6 (`-out`). Activated the multi-threaded feature of blastn to speed up the search by using 8 CPUs (`-num_threads`).

#### Reciprocal 
1. Make blastable database
      1. 1 `makeblastdb -in Theobroma_cacaoV2_annot_cds.fasta -dbtype nucl`  
            -  30,655 sequences; 44,438,113 total bases


    1.2 `cp completeCDS_DroughtDB_194Seqs.fasta .`
2. `blastn -db Theobroma_cacaoV2_annot_cds.fasta -query completeCDS_DroughtDB_194Seqs.fasta -out blastn_Droughtcacao_recip.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8`

#### Reciprocal Best Hits

1. findRBH.sh script
    `queryPath="/home/ncontrer/scratch/private/RBBH_2/1blastn_cacao_Drought/blastn_cacaoDrought.outfmt6"`
    `dbPath="/home/ncontrer/scratch/private/RBBH_2/2blastn__Drought_cacao/blastn_Droughtcacao_recip.outfmt6"`


*After all this, do another test to check if maxseqs should not be used. max seqs to default and compare*


#### 


--------------------------------- Results:  
#### RBBH
1. Results from `findRBH.sh`  
        queryHits,dbHits,bestHits
        32,29,29


------------- Extras

Run Blastn: `-evalue 1e-80` following Nicholls et al for better similarity, possibility to play with this.

1. job_script.sh
`
#!/bin/bash
#SBATCH --job-name="Blastn T.cacao CDS vs Drought"
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
blastn -db Theobroma_cacaoV2_annot_cds.fasta -query completeCDS_DroughtDB_194Seqs.fasta -out blastn_Droughtcacao_recip.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8
echo "Job finished"
`
2. findRBH.sh
`
#!/bin/bash
#Script to filter reciprocal blast results for best hits
#Usage: bash findRBH.sh /home/ncontrer/scratch/private/findRBH/.
#Usage ex: bash findRBH.sh blastn_malvNewt353_e80_tab.out blastn_CDSNewt_e80_tab.out
#Input query blast results file
queryPath="/home/ncontrer/scratch/private/RBBH_2/1blastn_cacao_Drought/blastn_cacaoDrought.outfmt6"
#Input DB reciprocal blast results file
dbPath="/home/ncontrer/scratch/private/RBBH_2/2blastn__Drought_cacao/blastn_Droughtcacao_recip.outfmt6"
#Final output files
outFileRBH="blast2.10_Cacao_DroughtDB_RBH.txt"
outFileSummary="blast2.10_Cacao_DroughtDB_RBH_summary.txt"
#Add headers to output RBH files
echo "queryHit,dbHit" > $outFileRBH
echo "queryHits,dbHits,bestHits" > $outFileSummary
#Output start status message
echo "Recording RBH..."
#Loop over query blast results
while IFS=$'\t' read -r f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12
do
#Determine RBH to DB blast results
if grep -q "$f2"$'\t'"$f1"$'\t' $dbPath; then #RBH
echo "$f1,$f2" >> $outFileRBH
fi
done < $queryPath
#Output summary of RBH
queryHits=$(wc -l "$queryPath" | cut -d ' ' -f 1)
dbHits=$(wc -l "$dbPath" | cut -d ' ' -f 1)
bestHits=$(($(wc -l "$outFileRBH" | cut -d ' ' -f 1)-1))
echo "$queryHits","$dbHits","$bestHits" >> $outFileSummary
#Output end status message
echo "Finished recording RBH!"
`