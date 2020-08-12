
##DroughtDB_genes
- Title: Collecting data from DroughtDB
- Date: Jan 10 2019
- wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/data/references/DroughtDB_genes
- What/Why: Collecting genes from the DroughtDB Database for adaptive genomic variation in Guazuma. This list of genes will be used to design baits in Guazuma, and as related to Drought the allelic variation will be analysed in relation with environ data.
- Further description in:
	- OneNote/DryLabBook/DroughtDB: Genes download and filtering
	- Readme.md in references/DroughtDB_genes
- Code/commands: 
	- manual database search
	- Code to extract sequence list names from Fasta file: `grep '>lcl' nameextraction.txt | cut -d '|' -f 2` 

- Results: 194/199 CDS genes. The database contains 199, but some of them were duplicates and for others I couldn't retrieve the cds sequences. Results in 
	- Final_CDS_assemble/completeCDS_DroughtDB_194Seqs.fasta


##Cacao_genomes
- Title: Cacao_genomes
- Date: May 2020
- Wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/data/references/Cacao_genomes
- What/Why: Collecting cacao genomes from different databases
- Further docs: 
	- Readme.md in Cacao_genomes
	- OneNote/DryLabBook/Alignment of cacao and drought genes
	- OneNote/2nd YRev/Bait design in T. cacao: review
- Code: manual download
- Results: 
| Genome | DataBase | Name/GeneBank | Cita | contigs/chromosome |
|:-:|:-:|:-:|:-:|:-:|
| Cacao Matina | Cacao Genome Database/NCBI | Cacao genome v0.9 / ALXC00000000.1 | Motamayour et al. 2013 | 1,782/10 |
| Criollo cocoa Genome Version 1 | Cocoa Genome Hub/NCBI | Genome Criollo V1 / CACC00000000.1 | Argout et al. 2011 | 4,792/10 |
| Criollo cocoa Genome Version 2 | Cocoa Genome Hub/NCBI | Genome Criollo V2 / GCA_000208745.2 | Argout et al. 2017 | 554/10 |


##Theobroma EST
- Title: Collecting EST libraries from Argout et al. 2008
- Date: 23 June 2020 - 10 July 2020
- Wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/data/references/Theobromac_EST
- What/Why: EST libraries download and filtering from EMBL DataBase (CU469588 to CU633156). To Blast the DroughtDB genes to the EST set to have an idea about how many could show up in Guazuma transcriptome (depending on what tissue the ESTs are from).
- Further docs:
	- Jupyter: Database_filtering.ipynb
	- OneNote: DryLabBook/Alignment of cacao and drought genes
- Code: see Database_filtering.ipynb
- Results: 18 EST libraries from relevant tissues (leave and shoot) and treatments (droughtLeaves + DroughtRoot). See Theobromacacao_EST_list_Argout2008.xls

