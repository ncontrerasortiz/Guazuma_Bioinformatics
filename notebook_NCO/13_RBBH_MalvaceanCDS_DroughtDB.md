## RBBH DroughtDB

- Title: Reciprocal Best Blast Hit DroughtDB against Malvaceae CDS genomes (Cacao CDS, Gossypium CDS, Guazuma transcriptome)
- Date: 12 July 2021
- Wd: `HPCrop /home/ncontrer/scratch/private/RBBH_2`
- What/Why: Find orthologous genes of DroughtDB in the T. cacao CDS annotated genome and Gossypium CDS genome. Then this orthologous will be mapped in the Guazuam transcriptome (in other notebook)
- Further docs: [RBBH protocol] (https://morphoscape.wordpress.com/2020/08/18/reciprocal-best-hits-blast-rbhb/), [Choosing BLAST options for better detection of orthologs as reciprocal best hits](https://academic.oup.com/bioinformatics/article/24/3/319/252715)

------------------------------------ Code and setup
- Query: T. cacao CDS, Gossypium CDS, Guazuma
- Subject: DroughtDB 194 sequences CDS  
- *Interactive job `$ srun --pty bash`*  
- *`sbatch --partition=long job_script.sh`*  
- *When running scripts in interactive job, example:*  
    `bash runrblast.sh ./query_file_path ./db_file_path ./output_path && bash findRBH.sh ./blast_query_file ./blast_reciprocal_file`

### Theobroma cacao

- Files in CropHPC  
    ├── 1blastn_xxx_Drought: **Blast** Malvaceae query against subject database Drought DB  
    ├── 2blastn__Drought_xxx: Reciprocal  
    ├── 3findRBH: Find best Hits Using script (see Extras)  

    #### Blast  
  1. Make blastable database
    1. 1`makeblastdb -in completeCDS_DroughtDB_194Seqs.fasta -dbtype nucl`  
        - 194 sequences; 254,699 total bases

    1.2 `cp Theobroma_cacaoV2_annot_cds.fasta .`
  2. Blastn
   `blastn -db completeCDS_DroughtDB_194Seqs.fasta -query Theobroma_cacaoV2_annot_cds.fasta -out blastn_cacaoDrought.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8`  

   Search a nucleotide query, T. cacao CDS (`-query`), with the megablast algorithm (`-task megablast`, default) against the database DroughtDB_194 (`-db`). Keep a maximum of 5 aligned sequences matches from the database (`max_target_seqs`).  Set the result format to tabular output (`-outfmt 6`), to a file named blastn_cacaoDrought.outfmt6 (`-out`). Activated the multi-threaded feature of blastn to speed up the search by using 8 CPUs (`-num_threads`).
   *after a test, I noticed that maxseqs 5 provides many repetitive sequences, thus will use only maxseqs 1*

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


### Gossypium 
  1. Same as before but with files and folders:  
        ├── 1blastn_gossypium_Drought
        │   └── Gossypium.1_ASM98774v1_cds.fna
        ├──2blastn__Drought_gossypium
        │   ├── completeCDS_DroughtDB_194Seqs.fasta
        ├── 3findRBH_gossypium

  2. Blast  
    `blastn -db completeCDS_DroughtDB_194Seqs.fasta -query Gossypium.1_ASM98774v1_cds.fna -out blastn_GossypiumDrought.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8`
  3. Reciprocal Blast  
    - `makeblastdb -in Gossypium.1_ASM98774v1_cds.fna -input_type fasta -dbtype nucl`  
        Database: Gossypium.1_ASM98774v1_cds.fna
        90,927 sequences; 120,332,977 total bases  
        `&&`
    - `blastn -db Gossypium.1_ASM98774v1_cds.fna -query completeCDS_DroughtDB_194Seqs.fasta -out blastn_DroughtGossypium_recip.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8`
  4. FindRBH.sh, done

### Guazuma
  1. Blast with DroughtDB 194 sequences
     -Guazuma data base `Guazuma_transcriptome.fasta`:  
          276,345 sequences; 226,016,119 total bases

  2. Blast was run with the script `runrblast.sh`
  3. Reciprocal best hits were found with the script `find_RBH.sh`
   
- Both things ran in an interactive job.
`bash runrblast.sh ./Theobroma_cacaoV2_annot_cds.fasta ./completeCDS_DroughtDB_194Seqs.fasta ./ && bash findRBH.sh ./blast_maxseqs1.outfmt6 ./blast_maxseqs1_reciprocal.outfmt6`

### Compare RBBH between Cacao and Gossypium 

### Then investigate about this genes


--------------------------------- Results:  
## DroughtDB 194 sequences

### **Test1: Maxseqs5**
#### RBBH Cacao
1. Results from `findRBH.sh`  
        queryHits,dbHits,bestHits
        32,29,29    

#### RBBH Gossypium
1. Results from `findRBH.sh`  
    2.10_Gossypium_DroughtDB_RBH_summary.txt 
        queryHits,dbHits,bestHits
        127,96,96

#### RBBH Guazuma
1. Results from `findRBH.sh` 
    queryHits,dbHits,bestHits
    38,37,37

### **Test 2: Maxseqs 1**
#### RBBH Cacao
1. Results from `findRBH.sh`  
queryHits,dbHits,bestHits
28,18,15

#### RBBH Gossypium
1. Results from `findRBH.sh`
queryHits,dbHits,bestHits
121,34,32

#### RBBH Guazuma
1. Results from `findRBH.sh` 
queryHits,dbHits,bestHits
37,18,17


#### Compare between Cacao and Gossypium
------------- Extras

Run Blastn: `-evalue 1e-80` following Nicholls et al for better similarity, possibility to play with this.

1. job_script.sh

#!/bin/bash
#SBATCH --job-name="Blastn T.cacao CDS vs Drought"
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
blastn -db Theobroma_cacaoV2_annot_cds.fasta -query completeCDS_DroughtDB_194Seqs.fasta -out blastn_Droughtcacao_recip.outfmt6 -evalue 1e-80 -outfmt 6 -max_target_seqs 5 -num_threads 8
echo "Job finished"

2. findRBH.sh for cacao and gossypium, I was adding the path in the script but not in the command.

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
1. `find_RBH.sh`
   
 #!/bin/bash
#Script to filter reciprocal blast results for best hits
#Usage: bash findRBH.sh PATH/TO/QUERY/BLAST/RESULTS PATH/TO/DB/BLAST/RESULTS
#Usage ex: bash findRBH.sh blast.outfmt6 blast_reciprocal.outfmt6
#Script taken and modified from https://morphoscape.wordpress.com/2020/08/18/reciprocal-best-hits-blast-rbhb/
#Input query blast results file
queryPath="$1"
#Input DB reciprocal blast results file
dbPath="$2"
#Final output files
outFileRBH="blast_RBH.txt2"
outFileSummary="blast_RBH_summary.txt2"
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

3. `runrblast.sh`
   
#!/bin/bash
#Script to perform a reciprocal blast search
#Usage: bash runRBLAST.sh PATH/TO/QUERY/FILE PATH/TO/DB/FILE PATH/TO/OUTPUTS
#Script taken and modified from https://morphoscape.wordpress.com/2020/08/18/reciprocal-best-hits-blast-rbhb/

#Input query file
inputQuery="$1"
#Input DB reciprocal file
inputDB="$2"

#Path to output results
outputPath="$3"

#Move to query directory
queryPath=$(dirname "$inputQuery")
cd "$queryPath"
#Make blastable protein DB of the input query
makeblastdb -in "$inputQuery" -dbtype nucl

#Move to DB directory
dbPath=$(dirname "$inputDB")
cd "$dbPath"
#Make blastable protein DB of the input DB
makeblastdb -in "$inputDB" -dbtype nucl

#Output start status message
echo "Beginning reciprocal BLAST..."

#Move to outputs folder
cd "$outputPath"

#Use blastp to search a database
blastn -query "$inputQuery" -db "$inputDB" -max_target_seqs 5 -outfmt 6 -evalue 1e-80 -num_threads 8 > blast.outfmt6

#Switch query and search paths for reciprocal search
blastn -query "$inputDB" -db "$inputQuery" -max_target_seqs 5 -outfmt 6 -evalue 1e-80 -num_threads 8 > blast_reciprocal.outfmt6

#Output end status message
echo "Finished reciprocal BLAST!"