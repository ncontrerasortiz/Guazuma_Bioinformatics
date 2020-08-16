
## Download 200 WGS cacao individuals from NCBI/ENA
Accession	PRJNA486011
Publication: Cornejo OE et al., "Population genomic analyses of the chocolate tree, Theobroma cacao L., provide insights into its domestication process.", Commun Biol, 2018;1:167

1. Download list of accessions (tab sep text: `accessions.txt`) from ENA (https://www.ebi.ac.uk/ena/browser/view/PRJNA486011): Fields Study Accession, FASTQ files (FTP) and Experiment title. 

2. Run this command to write one line command for each file to be download:

	`awk 'FS="\t", OFS="\t" { gsub("ftp.sra.ebi.ac.uk", "era-fasp@fasp.sra.ebi.ac.uk:"); print }' accessions.txt | cut -f3 | awk -F ";" 'OFS="\n" {print $1, $2}' | awk NF | awk 'NR > 1, OFS="\n" {print "ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh " " " $1 " ."}' > download.txt
	`

	- output example of one line code in `download.txt`:
	`ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR777/006/SRR7774156/SRR7774156.fastq.gz . `

	- As you'll see in case of paired-end data there are several files per accession: 378 fastq files

3. Download test in gruffalo: download OK of one file running the command:

	`ascp -QT -l 300m -P33001 -i /mnt/shared/apps/aspera/3.9.2/etc/asperaweb_id_dsa.openssh  era-fasp@fasp.sra.ebi.ac.uk:/vol1/fastq/SRR777/006/SRR7774156/SRR7774156.fastq.gz . `

4. Upload `download.txt` to gruffalo:
	 `scp /media/storage/'OneDrive - University of Edinburgh'/onedrive_storage/Guazuma/Genomics/Bioinformatics/code/CropDiversityHPC/download.txt ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/. `

		- Move `download.txt` to `/mnt/shared/projects/rbge/Guazuma/200WG_cacao`

5. Run the script file
	- Script
Option 1: `#!/bin/bash
#SBATCH --job-name="download200_ind"
#SBATCH --export=ALL 
while read LIST; do
$LIST; done < download.txt
`	
option 2:`#!/bin/bash
#SBATCH --job-name="test job"
#SBATCH --export=ALL 
echo "Starting job on $HOSTNAME"
while read LIST; do
$LIST; done < download.txt
echo "Job finished"
`
		- Run the script with sbathc
		`sbatch Script_download200.sh`
		-Job ID and outlog: `slurm-140139.out`

6. Files stored in: `/mnt/shared/projects/rbge/Guazuma/200WG_cacao
`

