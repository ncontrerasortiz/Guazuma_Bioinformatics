Files in this Folder

* mRNA = Transcriptome = expressed exons
* CDS = Coding sequence = all exons

File A: DroughtDB_exported_genes_21Jan2019.xlsx = Edited list of exported genes, original and orthologs (in process) sheets in this workbook 

File B: Orthologs_Unspliced_droughtDBase.txt = Fasta file with orthologs unspliced sequences, refer to sheet DroughtDB_exported_genes_21Jan2019 in File A

File C: DroughtDB_exported_genes150219.csv = File without edits download from DroughtDB

##TAIR
#Genes (+ introns, + UTRs): All Arabidopsis transcription unit (gene) sequences.
File D: AT_Genom_SeqsAll105.fasta = From TAIR database. Genomic Locus sequences Data set, Get sequences for all gene models/splice forms, 101+5 Genes query, 242 seqs results.
	#Contains all associated gene models within a locus
File E: AT_RepresGene105.fasta = From TAIR databaseGenomic Locus sequences Data set, Get one sequence per locus (representative gene model/splice form only), 101+5 Genes query, 100+5 results (not AT4G17645)
	#Contains representative gene models only (1) reference gene model for the locus. The Sequences and structural features for the locus are derived from the representative gene model.
	
#Transcripts (- introns, + UTRs): All Arabidopsis transcripts including predicted sequences. This datasets contains the UTRs but not the introns. Note that not ALL transcript sequences will include UTRs.

File F: AT_TranscUTR_AllGene105.fasta
File G: AT_TranscUTR_RepresGene105.fasta

#CDS (- introns, - UTRs): All Arabidopsis coding sequences including predicted sequences. Similar to the transcript files but lacking the 5' and 3' UTRs.
File H: AT_CDS_AllGene104.fasta
File I: AT_CDS_RepresGene104.fasta


Sent to Catherine
The multi-fasta file contains the coding sequences of 194 genes from the DroughtDB database. The database contains 199, but some of them were duplicates and for others I couldn't retrieve the cds sequences.

##NCBI_RefSeq: 
	#Complete Record: mRNA: Transcripts
	#Coding sequence: All exons
	#Gene: accesion numbers in file J, too big to save in the computer

File J: NCBI_genes_24.xlsx = Genes in NCBI Refseq, contains accesion numbers of transcripts and genomic sequences.
File K: CDS_24sequence_NCBI.fasta.txt
File L: mRNA_24sequence_NCBI.fasta.txt
CDS_seqsInfo_DroughtDB.xlsx = Spreadsheet with info for completeCDS_DroughtDB_194seqs

##IRGSP: Rice Genome Project Annotation
#Locus Genomic Sequence: Gene	
#Gene Model Sequence: CDS
File M: CDS_17seqs.fasta.txt
File N: Gene_17Seqs.fasta.txt

##ITAG: International Tomato Genome Sequencing Project (26 seqs, 2 repeat)
#cDNA sequence: mRNA
#CDS sequence 
File: Transcript_cDNA_26seqs.fasta.txt
File: CDS_26seqs.fasta.txt

##Other, other sources
File: cDNA_NCBI_4seq.txt
File: CDS_moreXgenes_4seqs.txt

## NCBI
File: Protein_sequences_toBlast and search cDNA seqs.txt = pasted protein sequences retrieved from DroughtDB, then Blast and then retreived acc numbers for each
File: CDS_sequence19seq.txt = the sequences retrieved from the query using accesions of the previous file
