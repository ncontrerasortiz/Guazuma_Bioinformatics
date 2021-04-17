# SEFARI HPC Workshop
###Introduction to the cluster and linux
`squeue` see the queue and what is running  
`srsh -p debug` Submit an interactive job, join for the workshop this specific debug node
`ctrl+z` stop the process  
`cd /` root  
`rmdir` remove directory or `rm -r`
`cp -r source destination` copy directories
`mv file newfilename`  
`sbatch -p debug script.sh`
`#SBATCH --partition debug` special queue for the training
`scancel -u username` cancelling a job
`scancel job_number`

- backed up in other system, if system fails doesn't loose anything

###Array (paralell) jobs
submitted script is run multiple times  
`#!/bin/bash

#SBATCH --partition debug
#SBATCH --cpus-per-task=4
#SBATCH --array=0-9 #run 10 times, iteration, change based on the

FILES=(*.fasta)
pigz -k -f ${FILES[$SLURM_ARRAY_TASK_ID]}
`
  #parse an input config file with e.g. file paths for an array job #split the input by line IFS=$'\n' #read the whole file with the sample info lines=( `cat "$configFile" `) #based on the SLURM_ARRAY_TASK_ID we pick a single line from the input file, and this will be the line that gets used #note the SLURM_ARRAY_TASK_ID starts at 1, but the array is zero-based, hence need to subtract 1 line=${lines[$SLURM_ARRAY_TASK_ID-1]

    you can also have multiple tab-separated values on the same line of your config file and then parse these out like so:13:33
    #parse the line #the line is tab delimited IFS=$'\t' #this handy bit of code turns the line into an array tokens=($line) #the dataset for the current instance of the script dataset=${tokens[0]} FASTAfile=${tokens[1]} path=${tokens[2]}13:33
    feel free to grab a copy of these code snippets - idea is Iain's originally so credit to him, not me

### bioconda
conda environment

### Singularity
to download and run containers  
`singularity pull docker://r-base` # pull a copy of R
`singularity run r-base_latest.sif` # run in with singularity

### Singularity Shell
`singularity shell r-base_latest.sif`
`uname -r` #investigate its Kernel
`singularity shell --bind /m`

### Building a container
1. create file called my-r.def
`cat my-r.def
Bootstrap: docker
From: debian:latest

%post
	apt-get -y update
	apt-get -y install r-base

%runscript
	exec R "$@"
`
2. `singularity build my-r.sif my-r.def` #Build a docker
3. `FATAL:   You must be the root user, however you can use --remote or --fakeroot to build from a Singularity recipe file
` Error message because we need to be root level to build them.
4. workaround: build the container in online. {Sylab}[https://cloud.sylabs.io/auth]
    1. sign in using Github
    2. Access tokens, then give a name to a Token, then copy it and paste it
    3. In gruffalo `singularity remote login` then copy the token from the web. Token verified
    4. `singularity build --remote my-r.sif my-r.def`
    5. `singularity run my-r.sif` Run the containers
        - Alias to make things easier: `alias sr="singularity run my-r.sif"` then `sr`

### Github
Git is a version control system, github is the host
Git hub wiki: useful to keep the pipelines documented.
commits as key points of the changes

### backups
Scratch: you don't loose data but they can't promise it wont be lost.

### CPU/cores

- To check how the job is running
squeue -u #which node my job is  
ssh {node_name}  
Top #see how is it running in that node  
