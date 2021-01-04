### Notebook A2 RNA de novo assembly

- Title: de novo assembly of RNA transcripts from A2 sample using Trinity v. 2.1.1 
- Date: 29 dec 2020
- Wd: HPCrop `/home/ncontrer/scratch/private/trinity_out_dir`
- What/Why: Strategy de novo assembly using Trinity (following Nicholls et al Inga)
- Further docs: 
	- Nicholls et al Inga
	- [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki/Running-Trinity)
	- Nature protocols: 10.1038/nprot.2013.084
	- Trinity Performance - see for Memory Usage notes (http://trinityrnaseq.github.io/performance/mem.html):
	<br>10 CPU -> 100 RAM
	<br>8 CPU -> 80 RAM

--------------------------------------------------------------
- Code: 

1. First try: Trinity using, ~1G of RAM per ~1M pairs of Illumina reads: allocated 80G RAM, 10 CPU counts/threads.
	`sbatch job_script.sh`
	` Trinity --seqType fq --left ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz --right ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz --max_memory 80G --CPU 10 --output ~/scratch/private/trinity_out_dir`
	- failed after 24 hours, because it was in the "medium" queue
	- To re run Trinity is necessary to clean the environment, remove the directory and create a new one (to remove also hidden files).

2. Second try: Trinity, 20CPU, 80GB, from clean environment. 17hr, Worked!
`sbatch --partition=long job_script.sh`
`Trinity --seqType fq --left ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_1.fq.gz --right ~/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/rawdata/A2_2.fq.gz --max_memory 80G --CPU 20 --output ~/scratch/private/trinity/trinity_out_dir`

-----------------------------------------------------------------
- Results: 
1. Trinity run for 17h from clean environ, using 20CPU, 80GB
	- `Trinity.fasta` is the assembly

2. Next: Quality assesment of the assembly (QC_assembly)
