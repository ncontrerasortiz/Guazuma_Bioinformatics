#data arrival 22-Dec-2020

## Folders:
	- QC_sample: Quality control report pre-sequencing 
	- Report_data: Quality report analysis after sequencing data, output raw data.


## Specifications
- In quotation:
	<br>Novogene
	<br>novaseq	100M reads (chosen Nov 2020)
	<br>mRNA seq (Guazuma) (Illumina PE150, Q30 ⩾ 80%)
	<br>Library preparation and sequencing (100M reads, 30GB data)

- Sequencing data information (after sequencing)
	<br>BatchNo. X204SC20113077-Z01-F001
	<br>Sample Quantity 1
	<br>Data Size(GB) 13.11
	<br>Sample Name A2


	<br>Sample A2
	<br>Raw reads 206218298 (it equals the amount of read1 and read2)
	<br>Raw data 30.9
	<br>Effective(%) 99.11
	<br>Error(%) 0.02
	<br>Q20(%) 98.20
	<br>Q30(%) 94.73
	<br>GC(%) 44.99
							

- In HPCCrop, backup projects
	- batch_download.csv: exported download links to files in server novogene
	- Downloaded files:
        - checkSize.xls
        - X204SC20113077-Z01-F001.zip : Reads from trasncriptome RBGE living plant Drought and wet treatments
        - MD5.txt

## downloading the data instructions
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