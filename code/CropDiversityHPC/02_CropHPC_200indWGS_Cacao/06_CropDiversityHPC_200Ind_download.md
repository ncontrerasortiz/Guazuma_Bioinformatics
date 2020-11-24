
## Download 200 WGS cacao individuals from NCBI/ENA
Accession	PRJNA486011
Publication: Cornejo OE et al., "Population genomic analyses of the chocolate tree, Theobroma cacao L., provide insights into its domestication process.", Commun Biol, 2018;1:167

1. Download list of accessions (tab sep text: `accessions.txt`) from ENA (https://www.ebi.ac.uk/ena/browser/view/PRJNA486011): Fields Study Accession, FASTQ files (FTP) and Experiment title. 

2. Run this command to write one line command for each file to be download. Modified script `, $3` to include all the files from the accessions:

	`awk 'FS="\t", OFS="\t" { gsub("ftp.sra.ebi.ac.uk", "era-fasp@fasp.sra.ebi.ac.uk:"); print }' accessions.txt | cut -f3 | awk -F ";" 'OFS="\n" {print $1, $2, $3}' | awk NF | awk 'NR > 1, OFS="\n" {print "ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh " " " $1 " ."}' > download_fix.txt
	`

	- output example of one line code in `download.txt`:
	`ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR777/006/SRR7774156/SRR7774156.fastq.gz . `

	- As you'll see in case of paired-end data there are several files per accession. The 1 and 2 files should have the same sequence IDs in the same order. The third file contains reads for which paired sequence was not generated and may contain reads labeled either /1 or /2
		- Total of **555 fastq files**.

3. Download test in gruffalo: download OK of one file running the command:

	`ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR777/006/SRR7774156/SRR7774156.fastq.gz . `

4. Create `download.txt` in gruffalo, copy and paste in `/mnt/shared/projects/rbge/Guazuma/200WG_cacao`:

	`touch download.txt`
	`nano download.txt` copy 555 lines from `download.txt` file in local

5. Run the script file
	- Script
Option 1: `#!/bin/bash
#SBATCH --job-name="download200_ind_555files"
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
echo "Starting job on $HOSTNAME"
while read LIST; do
$LIST; done < download.txt
echo "Job finished"
`
		- Run the script with sbathc
		`sbatch Script_download200.sh`
		-Job ID and outlog: `slurm-144182.out`


6. Files stored in: `/mnt/shared/projects/rbge/Guazuma/200WG_cacao
`

7. Count number of files
	- Count completed jobs in slurm:
	`fgrep -o Completed slurm-144182.out | wc -l`


	- Count number of files
	`ls *.fastq.gz | wc -l`



8. Test of files and understand files. There are some with 2 or 1 file, are they paired?
Answer: The 1 and 2 files should have the same sequence IDs in the same order. The third file contains reads for which paired sequence was not generated and may contain reads labeled either /1 or /2


## Download only paired reads
As some accessions have a third file that contains reads for which paired sequence was not generated and may contain reads labeled either /1 or /2.

1. Example test_files:

- Has 3 files fastq SRR7774308
`ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR777/008/SRR7774308/SRR7774308_2.fastq.gz .`

`gunzip SRR7774308*`

Sizes
1477529849 Aug 16 18:25 SRR7774308_1.fastq.gz
  30189170 Aug 16 18:24 SRR7774308.fastq.gz
1499672117 Aug 18 14:43 SRR7774308_2.fastq.gz (not downloaded in main 
folder 200ind only testfile)

- Has 1 file fastq SRR7774310
`gunzip SRR7774310`
9747206594 Aug 16 18:32 SRR7774310.fastq.gz

