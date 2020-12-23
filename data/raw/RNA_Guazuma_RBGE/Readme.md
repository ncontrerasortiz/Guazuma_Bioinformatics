#data arrival 22-Dec-2020

- Specification in quotation:
	Novogene
	novaseq	100M reads (chosen Nov 2020)
	mRNA seq (Guazuma) (Illumina PE150, Q30 ⩾ 80%)
	Library preparation and sequencing (100M reads, 30GB data)

BatchNo. X204SC20113077-Z01-F001
Sample Quantity 1
Data Size(GB) 13.11
Sample Name (at most 5 samples showed) A2

- In HPCCrop, backup projects
	- batch_download.csv: exported download links to files in server novogene
	- Downloaded files:
        - checkSize.xls
        - X204SC20113077-Z01-F001.zip : Reads from trasncriptome RBGE living plant Drought and wet treatments
        - MD5.txt

run Screen
create .csv file with exported link files from novogene web page

1. Download in batch
	1. Interactive job `srun --pty bash`
	2. run the command
		- batch_download.csv: Exported links to files
		- `wget -c -i batch_download.csv`
 
2. copy originals and unzip others

3. Succesful Download checks OK
	1. size ls -lt -h
<p>`-rw-rw-r-- 1 ncontrer ncontrer 338 Dec 22 10:37 batch_download.csv`
<p>`-rw-rw-r-- 1 ncontrer ncontrer  42 Dec 20 01:13 checkSize.xls`
<p>`-rw-rw-r-- 1 ncontrer ncontrer 14G Dec 20 00:35 X204SC20113077-Z01-F001.zip`
<p>`-rw-rw-r-- 1 ncontrer ncontrer 110 Dec 20 00:35 MD5.txt`

	2. md5 file check Ok