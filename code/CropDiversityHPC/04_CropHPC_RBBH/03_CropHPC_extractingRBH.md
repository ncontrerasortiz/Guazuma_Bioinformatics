### Extract sequences retrieve from findRBH lists

1. Where: `/home/ncontrer/scratch/private/alignRBH/extractRBHlist`
 	- `blast_NewtargTcacao_RBH.txt`: List of reciprocal best hits RBH, query and db (335)
 	- `malvaceae_targetfile.fasta`: **db** file with all Target files
	- `Theobroma_cacaoV2_annot_cds.fasta`: **query** file with all T. cacao genome

2. Extract sequences from both query and db, according to the list of RBH
	1. Split into two files `blast_NewtargTcacao_RBH.txt` by comma separator: using Excel or Libreoffice. Saved to files:
		- queryhits.txt
		- dbhits.txt
	2. Extract list of sequences from a fasta files using txt file with seq names
		<p>`IFS=$'\n'; for i in $(cat headersFILE);do  line=$(grep -nr "$i" multiFastaFILE); if [[ ! -z $line ]];then for j in $line;do lineNumber=$(echo $j | cut -d':' -f1); sed -n "$lineNumber p" multiFastaFILE; awk -v nb=$lineNumber 'NR > nb {if ($0 ~ ">") exit; else print $0 }' multiFastaFILE; done;fi;done | tee outputFILE.fasta`

			- Where headersFILE is the file containing one header per line ; multiFastaFILE is obviously your multifasta file. tee 'file output'

	3. count sequences
		`grep ">" file.fasta | wc -l`
			- `dbhits.fasta`: 344 ???
			- `queryhits.fasta`: 335
		

