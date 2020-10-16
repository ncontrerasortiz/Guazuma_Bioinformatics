05_CropDiversityHPC_Apps.md

## Bioconda
Location: `$APPS/conda`
Version: conda 4.8.3
Date installed: 14-08-2020

1. from `/mnt/shared/scratch/ncontrer/apps`
2. run `install-bioconda`
3. log out and log in
4. test installation with `$ conda --version`

More details see: https://help.cropdiversity.ac.uk/bioconda.html#

## Aspera
To download data from Database, fasp protocol using Aspera's ascp
Location: `/mnt/shared/apps/aspera/3.9.2`
pre-installed

- `ascp`: Command line program to download big files



Usage: ascp [OPTION] SRC... DEST
          SRC to DEST, or multiple SRC to DEST dir
          SRC, DEST format: [[user@]host:]PATH


#### Download files using Aspera

ascp -i <asperaweb_id_dsa.openssh with path> -k1 -Tr –l100m anonftp@ftp.ncbi.nlm.nih.gov:/<files to transfer> <local destination>

- NCBI
ascp -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh -k1 -Tr –l100m 
anonftp@ftp.ncbi.nlm.nih.gov:/<files to transfer> <local destination>

- ENA
ascp -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh -k1 -Tr –l100m era-fasp@fasp.sra.ebi.ac.uk:/<files to transfer> <local destination>

 typical download speeds observed are 100–500Mbps

- -i <asperaweb_id_dsa.openssh with path> = fully qualified path & file name where this public key file is located. This file is part of Aspera Connect distribution and is usually located in the ‘etc’ subdirectory.
- –T to disable encryption
- –k 1 enables resume of partial transfers
- –r recursive copy
- –l (maximum bandwidth of request, try 100M and go up from there)

#### Data download
1. see https://www.michaelgerth.net/news--blog/how-to-efficiently-bulk-download-ngs-data-from-sequence-read-databases

2. code from https://www.biostars.org/p/325010/ to print list of commands for many SRA (accessions list download from ENA fields Study Accession, FASTQ files (FTP) and Experiment title). Accessions.txt is tab separated. As you'll see in case of paired-end data, the paths to the two mate fastq files in accessions.txt are separated by semicolon, which we take into account.
	`awk 'FS="\t", OFS="\t" { gsub("ftp.sra.ebi.ac.uk", "era-fasp@fasp.sra.ebi.ac.uk:"); print }' accessions.txt | cut -f3 | awk -F ";" 'OFS="\n" {print $1, $2}' | awk NF | awk 'NR > 1, OFS="\n" {print "ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh " " " $1 " ."}' > download.txt
	`

3. lets download:

- Either by a simple loop:
while read LIST; do $LIST; done < download.txt

- or by using GNU parallel to have things parallelized:
cat download_test.txt | parallel "{}"






	