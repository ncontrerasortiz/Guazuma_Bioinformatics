# Notebook Trinity Assembly quality (QC) assesment

- Title: Trinity Transcriptome of A2: Quality assesment
- Date: 6 Jan 2021
- Wd: See result files in `Bioinformatics/data/processed/RNAtranscriptomeA2`; in HPC `transcriptome/qual_asses/`
- What/Why: Quality assesment of the trinity assembly (trinity.fasta)
- Further docs:
	- Nature protocols: 10.1038/nprot.2013.084
	- [Assembly quality assesment](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Transcriptome-Assembly-Quality-Assessment)
		1. **RNA-seq reads representation**: OK (read_repr/)
		2. **Representation of full-length protein coding**: Blast+ (full_protein/)
		3. Trinity Transcriptome Contig Nx and ExN50 Statistics (ExN50/)
		4. Detonate: compares different assemblies
		5. rnaQuast, uses databases, for de novo assemblies**

---------------------------------
## Code:

1. **Examine RNA-seq representation of the assembly**: capture and count all reads that map to the assembled transcript (proper pairs and improper or orphan read alignments).
	-  Align reads to transcriptome assembly using bowtie2.  
		Build bowtie2 index for the transcriptome:
	`bowtie2-build --threads 10 ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta
 	Trinity_index.fasta`
	- Align to capture statistics
	`bowtie2 -p 10 -q --no-unal -k 20 -x Trinity_index.fasta -1 ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz -2 ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz \
		2>align_stats.txt| samtools view -@10 -Sb -o bowtie2.bam`
	- Visualuze statistics
		`cat 2>&1 align_stats.txt`

	- Visualize read support in IGV: The bowtie2 aln are currently sorted by read name, re-sorted according to coordinate, indexed, then viewed along with the Trinity assemblies using the IGV browser as follows.
		1. Sort the alignments by coordinate: `samtools sort ../bowtie2.bam -o bowtie2.coordSorted.bam`
		2. Index the coordinate-sorted bam file: `samtools index bowtie2.coordSorted.bam`
		3. Index the Trinity.fasta file: `samtools faidx Trinity.fasta` (ran up to here using job_script3)
		4. Download to local: `rsync -avP --partial ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta .` and `/home/ncontrer/scratch/private/transcriptome/qual_asses/read_repr/view_IGV/bowtie2.coordSorted.bam`
		5. Run in local comp `Apps/IGV_Linux_2.8.2/igv.sh -g Trinity.fasta  bowtie2.coordSorted.bam`

2. **Full-length transcript analysis using BLAST+**: align the assembled transcripts against all known proteins and determine the number of unique top matching proteins that align across more than X% of its length. Similar analyses can be performed using nucleotide databases, running blastn instead of blastx.
	2.1 *Uniprot*: a comprehensive, high-quality and freely accessible resource of protein sequence and functional information
	- This ran with script Sbatch cpus-per-task=16, --mem=4G, partition long:  
	`
	#Build a blastable database
	makeblastdb -in uniprot_sprot.fasta -dbtype prot
	&& echo "blastdb done, running blastx" && 

	#Perform the blast search, reporting only the top alignment
	blastx -query ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta -db uniprot_sprot.fasta -out blastx.outfmt6 \ -evalue 1e-20 -num_threads 8 -max_target_seqs 1 -outfmt 6 
	&& echo "blastx done, running analyze_blastPlus_topHit_coverage.pl" &&

	#Examine the percent of the target being aligned to by the best matching Trinity transcript
	analyze_blastPlus_topHit_coverage.pl blastx.outfmt6 ~/scratch/private/transcriptome/trinity_out_dir/Trinity
		fasta uniprot_sprot.fasta
	`  
	File `blastx.outfmt6.txt.w_pct_hit_length`: adds fields to the blastx output file: top hit's length, percent of the hit's length included in the alignment to the Trinity transcript, and the header description for that database entry.  the distribution of percent length coverage for the top matching database entries is provided. 

	2.2 *Drought DB genes*: `completeCDS_DroughtDB_194Seqs.fasta` Ran using script job from before:
	`makeblastdb -in /home/ncontrer/projects/rbge/Guazuma/references/completeCDS_DroughtDB_194Seqs.fasta -dbtype nucl && echo "blastdb done, running blastn" &&
	blastn -query ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta -db /home/ncontrer/projects/rbge/Guazuma/references/completeCDS_DroughtDB_194Seqs.fasta -out blastn.outfmt6_droughtDB \
                -evalue 1e-20 -num_threads 20 -max_target_seqs 1 -outfmt 6 && echo "blastn done, running analyze_blastPlus_topHit_coverage.pl" &&
	analyze_blastPlus_topHit_coverage.pl blastn.outfmt6_droughtDB ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta /home/ncontrer/projects/rbge/Guazuma/references/completeCDS_DroughtDB_194Seqs.fasta
	echo "Job finished"`

	2.3 *T. cacao annot CDS*:`Theobroma_cacaoV2_annot_cds.fasta`
	`makeblastdb -in /home/ncontrer/projects/rbge/Guazuma/references/Theobroma_cacaoV2_annot_cds.fasta -dbtype nucl && echo "blastdb done, running blastn" &&
	blastn -query ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta -db /home/ncontrer/projects/rbge/Guazuma/references/Theobroma_cacaoV2_annot_cds.fasta -out blastn.outfmt6_cacaoCDS \
                -evalue 1e-20 -num_threads 20 -max_target_seqs 1 -outfmt 6 && echo "blastn done, running analyze_blastPlus_topHit_coverage.pl" &&
	analyze_blastPlus_topHit_coverage.pl blastn.outfmt6_cacaoCDS ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta /home/ncontrer/projects/rbge/Guazuma/references/Theobroma_cacaoV2_annot_cds.fasta
	echo "Job finished"
	`
3. **Contig Nx and ExN50 Statistics**: These statistics define assembly quality in terms of contiguity ("completeness" distribution of contig lengths). 
   **Esta mierda no funciona de ninguna manera, mejor ni saco el ExN50... porque ya ni me acuerdo para que lo queria**

	3.1 *N50*: Sequence length of the shortest contig at 50% of the total genome length. Based on the lengths of the assembled transcriptome contigs, we can compute the conventional Nx length statistic, such that at least x% of the assembled transcript nucleotides are found in contigs that are at least of Nx length.
	- Contig Nx Statistic: `TrinityStats.pl ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta`
	
	3.2 *ExN50*: The N50 statistic is computed as above but limited to the top most highly expressed genes that represent x% of the total normalized expression data.
	
		1.1 Calculate Alignment-free Transcript abundance (`/Transc_abund`) estimation using Kallisto (8cpu. 8G ram, time)
			`
			echo "Build an index" &&
			kallisto index -i transcripts.idx ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta &&
			echo "quantification" &&
			kallisto quant -i transcripts.idx -o output_kallisto -b 100 ~/projects/rbge/Guazuma/RNA_A2/A2_1.fq.gz ~/projects/rbge/Guazuma/RNA_A2/A2_2.fq.gz
			`
  			1.1.1 Build Transcript and Gene Expression Matrices.
   
    - *Error HERE*: `Error, cannot open file  at ./abundance_ests_matrix.pl line 196. Job finished`: Cannot open files in `file.listing_target_files.txt` or cannot open that file. *Try using other abundance stimator different than Kalisto*
      		1.1.2 Test 1: Used a new script (https://github.com/trinityrnaseq/trinityrnaseq/blob/devel/util/abundance_estimates_to_matrix.pl) because an error of the original one.
			`/home/ncontrer/scratch/apps/trinity/trinityrnaseq-v2.12.0/util/abundance_estimates_to_matrix.pl --est_method kallisto \
    		--gene_trans_map none \
       		--quant_files file.listing_target_files.txt \
   		 	--out_prefix kallisto`
	 		`
			1.1.3 Test 2: Workaround: Installing trinity from source wget. Removing trinity from conda. Trinity v 2.12. Same error.
			`sed -n '196p' abundance_estimates_to_matrix.pl`
			check https://github.com/trinityrnaseq/trinityrnaseq/issues/634
			1.1.4 Fixing file listing file, space at the end...Error continues (`Transc_abund/slurm-880778.out`)

		1.2 Calculate Alignment-based (genome free) Transcript abundance (`/Transc_abund`) estimation using Salmon Alignment-Based Mode: Needs FASTA file of the transcripts and a BAM (`bowtie1.bam`) file containing the alns (8cpu. 8G ram, time)

    - *Note*:  I did not use the Mapping Based mode, because Salmon required to create an index using the genome of the organism or some close organism (this could make me loose transcripts becuase my data is novel)
    - Has to be run using `srun --pty bash`
		`conda activate salmon`
		`salmon quant -t ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta -l A -a bowtie1.bam -o salmon_quant`
		*Error* The process is killed but I dont know why: see log.txt in `qual_asses/ExN50/Transc_abund_2`

	**Stopped here on 16th of June** No point on continuing

		1. Compute ExN50	
		`
		contig_ExN50_statistic.pl \
     	transcripts.TMM.EXPR.matrix ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta | tee ExN50.stats
	 	`


----------------------------------------
## Results:

1. **RNA-seq representation of the assembly** 
   Aim: asses the representation of the reads in the final assembly.
       - (results in `align_stats_trans1.txt`) see Appendix 1:  
		97.70% overall alignment rate.  
		55446792 (53.77%) aligned concordantly exactly 1 time  
	 	40952565 (39.72%) aligned concordantly >1 time  
	According to Trinity protocol this is a good number. It seems to me that a good proportion of the reads have align, yielding concordant alignments 1 or more times to the reconstructed transcriptome.

	- Visualize read support in Tablet/IGV: Done... some transcripts have a high amount of transcript coverage. This is probably due to the more expressed genes.

2. **Full-length transcript**
	Aim: Examine the number of transcripts that were assembled that appear to be full-length or nearly full-length against a database or transcriptome. 
   - (results in `blastx.outfmt6.w_pct_hit_length`) with extra columns:
	- db_hit_len: top hit's (protein at a database) length
	- pct_hit_len_aligned:  percent of the hit's length included in the alignment to the Trinity transcript. % de la proteina de la db que alineo con el transcript.
	- hit_descr: header description for that database entry
	- Interpretation: the hit_descr hit is db_hit_len in lenght and match this trinity transcript by pct_hit_len_aligned%
   - results in `blastx.outfmt6.hist`
    -  #hit_pct_cov_bin: %  of each trinity transcript length matched by a db hit
    -  count_in_bin: number of hits (data base entries)
    -  .>bin_below: number of hits having >Xbelow% alignment coverage, bin below if it is 90% row, below is 80%.

	2.1 *Uniprot*: protein sequence and functional information  
	- 3235 transcripts match 100% with proteins length.
	- 11984 proteins match >80% of a transcript length

	2.2 *DroughtDB*: Drought database 194 seqs
	- Transcripts: 19 with >80%, 30 with 79-50%, 17 with 49-40%, 32 39-3%. (% of the hit's length)
	- 26/194 drought seqs had >20% coverage of a Trinity transcript
	- 12/194 DB seqs had >80%
	- 21/194 DB seqs had >50%

	2.3 *T cacao annot CDS*
	- Transcripts: 24530 with >80% of the hit's length
	- 14263 cacao genes? had >80% coverage in transcripts

3. **Contig Nx and ExN50 Statistics**:
   Aim: 
   3.1 *N50*: Appendix 2


 NEXT! Trinity Transcriptome Contig Nx and ExN50
		1. Contig Nx results
---------------------

## Appendix

1. **RNA-seq reads representation**:
   - Trinity.fast  
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
	97.70% overall alignment rate`

		- A typical Trinity transcriptome assembly will have the vast majority of all reads mapping back to the assembly, and ~70-80% of the mapped fragments found mapped as proper pairs (yielding concordant alignments 1 or more times to the reconstructed transcriptome).

2. **Contig Nx Results**
################################
## Counts of transcripts, etc.
################################
Total trinity 'genes':	229742
Total trinity transcripts:	276345
Percent GC: 42.87
########################################
Stats based on ALL transcript contigs:
########################################

	Contig N10: 4200
	Contig N20: 3106
	Contig N30: 2402
	Contig N40: 1892
	Contig N50: 1443

	Median contig length: 432
	Average contig: 817.88
	Total assembled bases: 226016119

#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

	Contig N10: 3429
	Contig N20: 2369
	Contig N30: 1755
	Contig N40: 1252
	Contig N50: 884

	Median contig length: 382
	Average contig: 642.19
	Total assembled bases: 147537560

--------------------------------------------------------
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