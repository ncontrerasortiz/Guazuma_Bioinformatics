14 Jan 2021 08:33:03 GMT
Try, but not ran because magicblast does not accept the whole NCBI database... could run it with nt database, but error in databases mirrors, Ask in slack!

https://ncbi.github.io/magicblast/cook/paired.html

magicblast -query reads.fa -db /mnt/shared/apps/databases/ncbi/nt 
-paired -num_threads 10


#!/bin/bash
#SBATCH --job-name="MagicBlast to uniprot"
#SBATCH --cpus-per-task=20
#SBATCH --mem=6G
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
makeblastdb -in uniprot_sprot.fasta -dbtype nucl -parse_seqids -out uniprot_sprot -title "uniprot_sprot" && echo "makeblastdb done, next magicblast" &&
magicblast -query ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -query_mate ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz -db uniprot_sprot -infmt fastq -num_threads 20
echo "Job finished"

**-parse_seqids option is required to keep the original sequence identifiers


#!/bin/bash
#SBATCH --job-name="MagicBlast to NCBI nt"
#SBATCH --cpus-per-task=20
#SBATCH --mem=6G
#SBATCH --export=ALL 
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
magicblast -query ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -query_mate ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz -db nt -infmt fastq -num_threads 20 -remote
echo "Job finished"




**#aligns RNA reads to a genome and reports spliced alignments
magicblast -query ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -query_mate ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz -db /mnt/shared/apps/databases/ncbi/nt -infmt fastq -num_threads 10


