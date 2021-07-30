### Transcriptome assembly metrics Transrate

- Title: Transcriptome assembly metrics using Transrate
- Date: 15 July 2021
- Wd: HPCrop `/home/ncontrer/scratch/private/transcriptome/transrate_read2`
- What/Why: Second test to get complete Transrate metrics
- Further docs: (Transrate)[http://hibberdlab.com/transrate/getting_started.html]
------------------- Code and setup: 
1. gunzip read files `A2_2.fq.gz` and `A2_1.fq.gz`
        - `gunzip filename`: because transrate use version 0.6 Salmon, that can't deal with gz files.

2. Run transrate as:
    - `sbatch --partition=long transrate_read.sh`
#!/bin/bash
#SBATCH --job-name="Read mapping metrics transrate 2"
#SBATCH --cpus-per-task= 32
#SBATCH --mem=20G
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
~/scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta \
          --left ~/projects/rbge/Guazuma/RNA_A2/A2_1.fq \
          --right ~/projects/rbge/Guazuma/RNA_A2/A2_2.fq \
          --output=transrate_read2 \
          --threads 32
echo "Job finished"

1. Took around 20h to run

--------------------- Results:  

Calculating contig metrics...
Contig metrics:
-----------------------------------
n seqs                       276345
smallest                        201
largest                       15549
n bases                   226016119
mean len                     817.88
n under 200                       0
n over 1k                     62837
n over 10k                       45
n with orf                    77996
mean orf percent              57.48
n90                             318
n70                             687
n50                            1443
n30                            2402
n10                            4200
gc                             0.43
bases n                           0
proportion n                    0.0
Contig metrics done in 41 seconds

 Read mapping metrics:
 -----------------------------------
 fragments                 103109149
 fragments mapped           61647418
 p fragments mapped              0.6
 good mappings              59388838
 p good mapping                 0.58
 bad mappings                2258580
 potential bridges                 0
 bases uncovered           113850092
 p bases uncovered               0.5
 contigs uncovbase            167190
 p contigs uncovbase            0.61
 contigs uncovered            276345
 p contigs uncovered             1.0
 contigs lowcovered           276345
 p contigs lowcovered            1.0
 contigs segmented             35405
 p contigs segmented            0.13
 Read metrics done in 54741 seconds
 No reference provided, skipping comparative diagnostics
 TRANSRATE ASSEMBLY SCORE     0.0923
 -----------------------------------
 TRANSRATE OPTIMAL SCORE      0.2737
 TRANSRATE OPTIMAL CUTOFF     0.1257
 good contigs                 180432
 p good contigs                 0.65














see (transrate interpretation of results here)[http://hibberdlab.com/transrate/metrics.html#read-mapping-metrics]


--------------------------------------------------------------
- Extras