## Blast in Cacao Genome Hub 
- Title: Blastn_1e-5_CDSCriollo
- Date: May 2020
- Wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/exploratory/Blastn_1e-5_CDSCriollo
- What/Why: Blast of DroughtDB (query) vs CDSCriolloV2 in Cocoa Genome Hub web. To explore the distribution of the Drought genes in Cacao genome
- Further docs: in folder
- Code: No code, Blast data base web
- Results: see folder. But results not very useful for me...not clear. More than half of the sequences have coverage above 70%, so I would say it is good as several of these genes are present in cacao. 
For this test I didn't pay attention to the query-subject for the reciprocal blast, so was doing it wrong...

## Blast+ DroughtDB vs Cacao data
- Title: Blast_Droug_Cacao
- Date: June-July 2020
- Wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/exploratory/Blast_Droug_Cacao
- What/Why: Several Exploratory blast using Blast+ command line
- Blast DroughtDB 194 vs Criollo V2 CDS
                         Criollo V2 scaffolds
                         EST 163K 
                         EST 17 libraries
 
- Graphs of Query vs number of hits: Criollo V2 CDS, EST 17 libraries

	### Blast_TheobromaEST_DroughtDB.ipynb
- test1_1_EST_Blast: Theobroma cacao EST (163,304 sequences)
- test1_2_EST_filtered: Filtered ESTs for leaves, shoots, root-drought
- test2_1_CriolloV2_CDS_Blast: Genome Criollo V2 CDS intron less
- test2_2_CriolloV2_Scaffolds_Blast: Genome Criollo V2 Scaffolds

	### test3_1_Blast_graph
- Wd: /media/storage/OneDrive - University of Edinburgh/onedrive_storage/Guazuma/Genomics/Bioinformatics/exploratory/Blast_Droug_Cacao/test3_1_Blast_graph
- What/Why: Bar plot: Query (DroughtDB) vs. Number of hits. Know the distribution of hits across the DroughtDB (194 seqs) dataset.
- Further docs: Plotting Blast results.ipynb
- Code: in Plotting Blast results.ipynb
- Results: 
		- test1_1_EST_Blast: 25/194 sequences had hits in the complete EST dataset
		- test1_2_EST_filtered: 14/194 sequences in 17 EST
		- test2_1_CriolloV2_CDS_Blast: 33/194 sequences in CDS Genome Criollo V2
		- test2_2_CriolloV2_Scaffolds_Blast: 34/194 sequences Scaffolds Genome Criollo V2

	### test 4: 
	- Title: Protein Blast
	- Date:
	- Wd:
	- What/Why:
	- Further docs:
	- Code:
	- Results:  

