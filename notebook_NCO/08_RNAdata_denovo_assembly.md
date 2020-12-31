### Notebook A2 RNA de novo assembly

- Title: de novo assembly of RNA transcripts from A2 sample using Trinity v. 2.1.1 
- Date: 29 dec 2020
- Wd: HPCrop `/home/ncontrer/scratch/private/trinity_out_dir`

- What/Why: Strategy de novo assembly using Trinity (following Nicholls et al Inga)

- Further docs: 
	- Nicholls et al Inga
	- Trinity (https://github.com/trinityrnaseq/trinityrnaseq/wiki/Running-Trinity)
	- Nature protocols: 10.1038/nprot.2013.084
	- Trinity Performance - see for Memory Usage notes (http://trinityrnaseq.github.io/performance/mem.html)

- Code: 

1. Trinity using, ~1G of RAM per ~1M pairs of Illumina reads: allocated 80G RAM, 10 CPU counts/threads.
	`sbatch job_script.sh`
	` Trinity --seqType fq --left ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz --right ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz --max_memory 80G --CPU 10 --output ~/scratch/private/trinity_out_dir`
	- failed after 24 hours, because it was in the "medium" queue

2. Trinity, 20CPU, 80GB
`sbatch --partition=long job_script.sh`
`Trinity --seqType fq --left ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz --right ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz --max_memory 80G --CPU 20 --output ~/scratch/private/trinity_out_dir`

Slurm
hela 64 CPUs count=(2CPUx16coresx2Threads)
Does Trinity rewrite the files? or appends the new data everytime the run stopped? 
Next: re-run the analysis in clean environment to test. Using 20CPU 100GB

Seems that the arrangement of 10 CPU to 80GB is ok, although not ideal because 10->100GB is better according to links, 10GB per instance.
10 CPU -> 100 RAM
8 CPU -> 80 RAM


- Results:  