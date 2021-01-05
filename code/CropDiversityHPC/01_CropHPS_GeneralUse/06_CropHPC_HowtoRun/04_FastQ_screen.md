#How to Run FastQ_screen
- [FastQ Screen](https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/), check video tutorials
- FastQ Screen v0.14.0
------------------------------------------------
1. Download genomes index using `fastq_screen --get_genomes` in wd `/home/ncontrer/scratch/apps/FastQ_Screen_db`
		- Here comes with a `fastq_screen.conf` file that can be called with `--conf`	
		- This would have to be done only once for the test data

2. If downloding other genomes, have to build bowtie2 index before. See below.

3. Configuring the .conf file:
	- set databases (bowtie indexs have to be build previously) accordingly with paths, if not using the config file that includes all indexes:`/home/ncontrer/scratch/apps/FastQ_Screen_db/FastQ_Screen_Genomes/fastq_screen.conf`

4. Things that NEED to go in the config file
	- Path to downloaded indexes as: `/home/ncontrer/scratch/apps/FastQ_Screen_db/FastQ_Screen_Genomes/[andfolder]`
	- Except in config file that includes all indexes where paths are already specified:`/home/ncontrer/scratch/apps/FastQ_Screen_db/FastQ_Screen_Genomes/fastq_screen.conf`
	- enable or disable (#) desired databases

5. Things that NEED to go in `job_script.sh`:
	- at least 6G RAM memory for bowtie2: `#SBATCH --mem=6G`
	- command:
	`fastq_screen --aligner bowtie2 --threads [number] --conf [PATH TO fastq_screen.conf] file_to_analyze.fastq.gz`
		- Threads equals `--cpus-per-task=`/2 (eg.Threads 4=8--cpus-per-task/2)
	- Path to general config file that includes all indexes:`/home/ncontrer/scratch/apps/FastQ_Screen_db/FastQ_Screen_Genomes/fastq_screen.conf`

------------------------------------------------
To add more genomes or data to the databases
1. Create indexes from bowtie2 using `bowtie2-build reference_genome`
2. Genome indexes extra added:
	- Zeam mays ok
	- Oriza sativa ok
	- Malvaceae:
		- Gossypium hirsutum cds ok
		- Herrania nycterodendron
		- Theobroma CDS ok
		- Theobroma complete



