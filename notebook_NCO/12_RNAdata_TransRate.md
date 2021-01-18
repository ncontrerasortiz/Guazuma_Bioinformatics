### Notebook: TransRate

- Title: Transcriptome quality assesment using TransRate
- Date: 18 Jan 2021
- Wd: in HPC `scratch/private/transcriptome/transrate`
- What/Why: Software for de-novo transcriptome assembly quality analysis. Analyse a de-novo transcriptome assembly using three kinds of metrics:
          1. sequence based (if --assembly is given): contig
          2. read mapping based (if --left and --right are given)
          3. reference based (if --reference is given): comparative

- Further docs:
  - [transrate url](https://hibberdlab.com/transrate/index.html)
--------------------------------------------------------------
- Code and setup:

  0. Example data
      - Read mapping metrics:`~/scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly transcripts.fa \
            --left left.fq \
            --right right.fq`

  1. Sequence based: Contig metrics: `transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta
  `
  2. Read mapping metrics: `~/scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta \
            --left ~/projects/rbge/Guazuma/RNA_A2/A2_1.fq.gz \
            --right ~/projects/rbge/Guazuma/RNA_A2/A2_2.fq.gz \
            --output=transrate_read \
            --threads 16`
            - Does not run because Snap rans out of memory, nor workaround for this, instead see if other options. Only analyse contig and comparative metrics
  3. reference based: `~/scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta \
            --reference ~/projects/rbge/Guazuma/references/Theobroma_cacaoV2_annot_cds.fasta \
            --output=transrate_reference \
            --threads 16`
            - This analysis can take a long while to run because of the BLAST alignments.

--------------------------------------------------------------
- Results:
  1.
  2.
  3. Done! check Results is NEXT!
--------------------------------------------------------------
- Extras
1. Conda Install
  - Installation workaround when "could not find snap in the path" and dependencies missing ERROR prompt:
    `conda create -n transrate-app #create an environment, not necessary but to lazy to install outside in the main
    conda activate transrate-app #Needed to run this app in this environ
    conda install -c bioconda transrate
    conda install -c bioconda sn
    ap-aligner #if ERROR: "could not find snap in the path", then need  to install snap-aligner
    transrate --assembly transcripts.fa #worked!`
    `whereis salmon
    $ /mnt/shared/scratch/ncontrer/apps/conda/envs/transrate-app/bin/salmon `
  - Script to run TransRate within a conda environment
    `#!/bin/bash
    #SBATCH --job-name="Job title"
    #SBATCH --export=ALL
    #SBATCH --cpus-per-task=8
    #SBATCH --mem=10G
    source activate transrate-app
    transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/ Trinity.fasta
    echo "Job finished"
    `
  - Script for Read mapping metrics
  `#!/bin/bash
  #SBATCH --job-name="Read mapping metrics transrate"
  #SBATCH --cpus-per-task=8
  #SBATCH --mem=6G
  #SBATCH --export=ALL
  #SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
  #SBATCH --mail-type=END,FAIL
  source activate transrate-app
  transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/ Trinity.fasta \
            --left ~/projects/rbge/Guazuma/RNA_A2/A2_1.fq.gz \
            --right ~/projects/rbge/Guazuma/RNA_A2/A2_2.fq.gz \
            --threads 16
            echo "Job finished"
            `
2. Installing binary
   - Installing transrate from binary using wget, No conda!
    1. wget url... from transrate web
    2. To call the thing use `~scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate` and the rest as normal
    3. workaround for missing dependencies: "mv librt.so.1 librt.so.6" command in the /bin directory of Transrate (https://github.com/blahah/transrate/issues/202)
    4. Install all dependencies using command from transrate


  - script
  `
  #!/bin/bash
  #SBATCH --job-name="Reference metrics transrate"
  #SBATCH --partition=long
  #SBATCH --cpus-per-task=32
  #SBATCH --mem=6G
  #SBATCH --export=ALL
  #SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
  #SBATCH --mail-type=END,FAIL
  ~/scratch/apps/transrate/transrate-1.0.3-linux-x86_64/transrate --assembly ~/scratch/private/transcriptome/trinity_out_dir/Trinity.fasta \
            --reference ~/projects/rbge/Guazuma/references/Theobroma_cacaoV2_annot_cds.fasta \
            --output=transrate_reference \
            --threads 32
  echo "Job finished" `  
