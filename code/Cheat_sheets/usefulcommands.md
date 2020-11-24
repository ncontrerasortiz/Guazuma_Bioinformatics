#Useful commands

- Merge files into one

`cat file1.fasta file2.fasta file3.fasta > ./merged_file.fasta`

- Counting objects in a file, sequences in fasta file
`grep ">" file.fasta | wc -l`
`grep -c "^>" file.fa`

- Column selection in sublime in Linux
`alt` + `shift` + `up` or `down`

`alt` + `ctrl` + rigth click

- add something to end of all header lines:

`sed 's/>.*/&WHATEVERYOUWANT/' file.fa > outfile.fa`

- clean up a fasta file so only first column of the header is outputted:

`awk '{print $1}' file.fa > output.fa`

- Extracting sequence headers (names) from a Fasta
`grep -e ">" my.fasta`
`awk 'sub(/^>/, "")'`

- Print duplicates in a list
`sort File.txt | uniq -cd`


