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
blastn -query "$inputQuery" -db "$inputDB" -max_target_seqs 1 -outfmt 6 -evalue 1e-80 -num_threads 8 > blast.outfmt6

#Switch query and search paths for reciprocal search
blastn -query "$inputDB" -db "$inputQuery" -max_target_seqs 1 -outfmt 6 -evalue 1e-80 -num_threads 8 > blast_reciprocal.outfmt6

#Output end status message
echo "Finished reciprocal BLAST!"
