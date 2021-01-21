# Notebook Trinity Assembly quality (QC) assesment

- Title: Trinity Transcriptome of A2: Quality assesment
- Date: 6 Jan 2021
- Wd: See result files in `Bioinformatics/data/processed/RNAtranscriptomeA2`; in HPC `transcriptome/qual_asses/`
- What/Why: Quality assesment of the trinity assembly (trinity.fasta)
- Further docs:
	- Nature protocols: 10.1038/nprot.2013.084
	- [Assembly quality assesment](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Transcriptome-Assembly-Quality-Assessment)
		- RNA-seq reads representation: OK (read_repr/)
		- Representation of full-length protein coding: Blast+ (full_protein/)
		- Detonate: compares different assemblies
		- rnaQuast, uses databases, for de novo assemblies**

---------------------------------
### Code:

1. Examine RNA-seq representation of the assembly: capture and count all reads that map to the assembled transcript (proper pairs and improper or orphan read alignments).
	-  Align reads to transcriptome assembly using bowtie2.  
		Build bowtie2 index for the transcriptome:
	`bowtie2-build --threads 10 ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta
 	Trinity_index.fasta`
	- Align to capture statistics
	`bowtie2 -p 10 -q --no-unal -k 20 -x Trinity_index.fasta -1 ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -2 ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz \
		2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam`
	- Visualuze statistics
	`cat 2>&1 align_stats.txt`
	- Visualize read support in IGV
		1. Sort the alignments by coordinate: `samtools sort ../bowtie2.bam -o bowtie2.coordSorted.bam`
		2. Index the coordinate-sorted bam file: `samtools index bowtie2.coordSorted.bam`
		3. Index the Trinity.fasta file: `samtools faidx Trinity.fasta` (ran up to here using job_script3)
		4. `igv.sh -g Trinity.fasta  bowtie2.coordSorted.bam`
		5. Download to local: `rsync -avP --partial ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta .` and `/home/ncontrer/scratch/private/transcriptome/qual_asses/read_repr/view_IGV/bowtie2.coordSorted.bam` **IN PROGRESS**

2. Full-length transcript analysis using BLAST+: align the assembled transcripts against all known proteins and determine the number of unique top matching proteins that align across more than X% of its length. Similar analyses can be performed using nucleotide databases, running blastn instead of blastx.
	- This ran with script Sbatch cpus-per-task=16, --mem=4G, partition long
	`makeblastdb -in uniprot_sprot.fasta -dbtype prot && echo "blastdb done, running blastx" &&
	blastx -query ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta -db uniprot_sprot.fasta -out blastx.outfmt6 \
-evalue 1e-20 -num_threads 8 -max_target_seqs 1 -outfmt 6 && echo "blastx done, running analyze_blastPlus_topHit_coverage.pl" &&
	analyze_blastPlus_topHit_coverage.pl blastx.outfmt6 ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta uniprot_sprot.fasta`


----------------------------------------
### Results:

1. RNA-seq representation of the assembly (in `align_stats_trans1.txt`) see Appendix 1:  
		97.70% overall alignment rate.  
		55446792 (53.77%) aligned concordantly exactly 1 time  
	 	40952565 (39.72%) aligned concordantly >1 time  
According to Trinity protocol this is a good number. ~93% of the mapped fragmens are proper pairs (concordant alignments 1 or more times)

	- Visualize read support in Tablet: Done... need to understand in context

2. Full-length transcript

	-

---------------------
### Extras
	- Job script
`#!/bin/bash
#SBATCH --job-name="bowtie2_transcriptomeIndex"
#SBATCH --cpus-per-task=20
#SBATCH --mem=6G
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
commands
echo "Job finished"
`
	- Job script3
	`#!/bin/bash
#SBATCH --job-name="Visualize read support in IGV"
#SBATCH --cpus-per-task=16
#SBATCH --mem=16G
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
samtools sort -m 1500000000 -@ 8 ~/scratch/private/transcriptome/qual_asses/bowtie2.bam -o bowtie2.coordSorted.bam && echo "samtools sort done, running index" &&
samtools index bowtie2.coordSorted.bam -@ 8 && echo "samtools index done, running faidx" &&
samtools faidx ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta
echo "Job finished"
` Note: (16G/8threads)(75%)=1.5G per thread in sort -m

-db /mnt/shared/apps/databases/ncbi/nt

-----------------------------
### Appendix

1. Trinity.fast
`align_stats

103109149 reads; of these:
  103109149 (100.00%) were paired; of these:
    6709792 (6.51%) aligned concordantly 0 times
    55446792 (53.77%) aligned concordantly exactly 1 time
    40952565 (39.72%) aligned concordantly >1 times
    ----
    6709792 pairs aligned concordantly 0 times; of these:
      1094080 (16.31%) aligned discordantly 1 time
    ----
    5615712 pairs aligned 0 times concordantly or discordantly; of these:
      11231424 mates make up the pairs; of these:
        4742003 (42.22%) aligned 0 times
        2296798 (20.45%) aligned exactly 1 time
        4192623 (37.33%) aligned >1 times
97.70% overall alignment rate

#A typical Trinity transcriptome assembly will have the vast majority of all reads mapping back to the assembly, and ~70-80% of the mapped fragments found mapped as proper pairs (yielding concordant alignments 1 or more times to the reconstructed transcriptome).`
