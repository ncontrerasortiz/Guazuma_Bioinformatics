# Transcript quantification using Salmon (transcript Count)

- Title: Drought Gene Quantification (using Salmon)
- Date: 14 July 2021
- Wd: HPCrop `/home/ncontrer/scratch/private/trans_quant`
- What/Why: 
    - Quantify expression at transcript level, infer the approximate number of expressed transcripts as the number that are expressed above some minimum expression threshold. 

    - Also want to compare the names of the most expressed transcripts with the list of query bestHits from the RBBH_2 and see if they were highly expressed. salmon v1.5.1

- Further docs: RNA-seq training Booklet, [Trinity Transcript Quantification](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Trinity-Transcript-Quantification#counting-expressed-genes), [Salmon V 1.5.1.](https://combine-lab.github.io/salmon/getting_started/)
  
- Background:
  Abundance estimation methods will provide *transcript-level* estimates of the count of RNA-Seq fragments that were derived from each transcript, in addition to a normalized *measure of transcript expression that takes into account the transcript length, the number of reads mapped to the transcript, and the the total number of reads that mapped to any transcript*. Normalized expression metrics may be reported as 'fragments per kilobase transcript length per million fragments mapped' (FPKM) or *'transcripts per million transcripts' (TPM)*. The TPM metric is preferred to FPKM, because all values will always sum up to 1 million (FPKM values will tend to not sum up to the same value across samples).
  - Salmon: Alignment-free abundance estimation method
  
------------- Code and setup
- *Interactive job `$ srun --pty bash`*  
- *Salmon V 1.5.1 `conda activate salmon`*

1. This was done using the SNAP aln (`A2_1.fq.A2_2.fq.Trinity.bam`) produced with transrate (see notebook transrate_metrics)

2. Quantifying using Salmon in alignment-based mode

    1. `srun --partition=short --cpus-per-task=16 --mem=10G --pty bash`
    2. `conda activate salmon`
    3. `salmon quant -t Guazuma_transcriptome.fasta -l IU -a A2_1.fq.A2_2.fq.Trinity.bam -p 16 -o salmon_quant`

3. Build Transcript and Gene Expression Matrices (using Trinity)  
    `./abundance_ests_matrix.pl --est_method salmon --gene_trans_map none --quant_files file.txt --out_prefix TranscMat_DroughtDB`
        - `--quant_files file.txt`: file containing only `quant.sf`, only that string and this file should be in the same directory where sbatch is started.
    
4.  Counting Numbers of Expressed Transcripts(using Trinity): Given a matrix of TPM values, you can plot the number transcripts that are expressed above a minimum TPM expression threshold in any sample like so.

    `~/scratch/apps/trinity/trinityrnaseq-v2.12.0/util/misc/count_matrix_features_given_MIN_TPM_threshold.pl TranscMat_DroughtDB.isoform.TPM.not_cross_norm | tee TranscMat_DroughtDB.isoform.TPM.not_cross_norm.counts_by_min_TPM`

-----------------------------
- Results:  

 1. From Salmon: `salmon_quant`: `quant.sf` (contains the quantification results for the run)
 2. From Trinity:  
        -`TranscMat_DroughtDB.isoform.counts.matrix`: used for downstream analyses of differential expression
        -`TranscMat_DroughtDB.isoform.TPM.not_cross_norm`
        -`TranscMat_DroughtDB.isoform.TPM.not_cross_norm.counts_by_min_TPM`: output for gene counts as a function of minimum TPM value
3. Visualize
   In R: `data = read.table("TranscMat_DroughtDB.isoform.TPM.not_cross_norm.counts_by_min_TPM", header=T)
plot(data, xlim=c(-100,0), ylim=c(0,100000), t='b')`

4. *Plot Explained* 

 The vast majority of all expressed features have very little expression support. Does it mean that I have to filter the ones that are lowly expressed (low TPM)


--------------------------------------------------------------
- Extras