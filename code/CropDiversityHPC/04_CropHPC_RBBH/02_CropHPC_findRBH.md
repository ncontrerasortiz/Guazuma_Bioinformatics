
###Find RBH script
Using the script `findRBH.sh` from `https://morphoscape.wordpress.com/2020/08/18/reciprocal-best-hits-blast-rbhb/` to identify the RBH:

1. Create folder with `outfmt6` files
- Blast
<p>`blastn_Blast_eval.outfmt6`
- Reciprocal
<p>`blastn_Reciprocal_e80.outfmt6`

2. Modify Query and DB path in `findRBH.sh`:
`queryPath="PATH/TO/outfmt6_Blast"` and
`dbPath="PATH/TO/outfmt6_Reciprocal"`

3. Set execute permission on script and run 
$`chmod +x findRBH.sh`
$`./findRBH.sh`

4. Output files:
	<p>`blast_RBH_summary.txt`: statistics about the RBH. include the number of reciprocal best hits, in addition to the number of hits found for each of the species against the other.
		- queryHits,dbHits,bestHits
	<p>`blast_RBH.txt`:RBH for the reciprocal BLAST
		- queryHit,dbHit

`bestHits` in `blast_RBH_summary.txt` must be the same (minus 1 for headers) number as when running `wc -l blast_RBH.txt` to count number of lines.




##Extra: Notes on the script
- The number of reciprocal best hits are recorded by looping through the first BLAST results file and comparing each line with the second BLAST results file

- The columns with the sequence names of the query (column 1) and db (column 2) hits are retrieved from each line of the first results file, and compared as a line to each entry in the second results file using grep. The fields containing the first ($f1) and second ($f2) columns are switched in the grep command to correctly compare reciprocal hits between the two results files.