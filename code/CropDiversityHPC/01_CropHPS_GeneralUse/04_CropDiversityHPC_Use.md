04_CropDiversityHPC_Slurm_comm.md
Connect `ssh gruffalo`
Logout `exit`
local key: `natalicon1`
Random password: 4Gz}f&qIZP?XKP|YRn0N;2

# Getting around Slurm: 
This is for data analysis (not Gruffalo)
Here are the commands to create jobs and get around the environ.

Nodes are named in the form
`nYY-CPU-MEM-name`  
`n19-32-192-hulk`
purchased in 2019-has 32 CPU cores-192 GB of memory-named hulk
All nodes (except Cortana) actual CPU count is doubled: 64 ‘CPUs’ are available for use on hulk.

- Slurm Shortcuts and aliases: https://help.cropdiversity.ac.uk/slurm-shortcuts.html
- Complete overview: https://help.cropdiversity.ac.uk/slurm-overview.html

## File directories
Temporary/intermediate working data should be in Scratch, not in a backed up area.

- `mnt/shared/home/ncontrer`
	Backep up: yes
	Shortcut: `$HOME`
	- not suitable for storing large data sets **kept to less than 10 GB.**

- `/mnt/shared/projects/rbge`
	Backed up: yes
	- All important Institute-related project data should be here. Move here final data ready to back up.

- `/mnt/shared/scratch/ncontrer/apps`
	Backep up: no
	Shortcut: `$APPS`
	- for **all** downloaded (ie external) software applications – either in binary or compiled-from-source form.
	

### Scratch areas
The contents are automatically erased when the job ends, so you must copy any files you need to keep back to somewhere on shared storage as the final step in your job script.

- Shared scratch `/mnt/shared/scratch/ncontrer`
	Backep up: no
	Shortcut: `$SCRATCH`
	- For large throwaway files which either do not need to be kept or can easily be regenerated. good for parallel access to large data files.

- Local scratch `/mnt/shared/scratch/ncontrer`
	Backep up: no
	Shortcut: `$TMPDIR`
	- good for tasks that require high performance with many small files. Automatically created and destroyed at the beginning and end of each job task and only visible to the node running that task.


## General Commands
- Manual `man slurm`
- `sbatch` and `srun` to initiate jobs
- `squeue` to report status of job (R=active, PD=waiting)
- List available resources `sinfo -N` : unused (idle), partially used by running jobs (mix) or completed occupied (alloc). An offline node will shown as down.
- Each job task is assigned 1 CPU and 4 GB of memory by default, submitted to the medium queue.
- Graphical overview of the cluster: https://www.cropdiversity.ac.uk/top/

## Interactive jobs
Starting an interactive job is a quick and easy way to get access to a powerful compute node, allowing you to start running analyses with the minimum of fuss.

- to start an interactive job ( by def. 1 CPU and 4 GB of memory)
		`$ srun --pty bash`
		`$ srsh` Allows for providing additional resource parameters

- allocation is reserved for your use for the entire time the shell is active `exit` or `CTRL+D` - when not using the resources.

## Batch jobs
Most long running jobs should be handled using a job script.
- Script example:
`
#!/bin/bash
#SBATCH --job-name="test job"
#SBATCH --export=ALL 
echo "Starting job on $HOSTNAME"
sleep 60
echo "Job finished"
`
	` #SBATCH --export=ALL`: to export all environment variables from the submitting shell into the job’s environment (def if not specified)

- Submit the job `sbatch script_name.sh`
	`$ sbatch test.sh`
	- Output and error information printed to the screen are merged together into a file name: 
		`--error=<filename pattern>` 
		`--output=<filename pattern>`
	`sbatch test.sh --error=testerror --output=testoutput`

## Array jobs
The submitted script is run multiple times in parallel.

- Individual instances of the job (tasks), are distinguished by the value of the environment variable:
	 `$SLURM_ARRAY_TASK_ID`
	 If an Array job of 10 tasks: value of 1 in the first instance, 2 in the second instance and so on up to 10
- to specify an array job use `--array`
- Example
	1. Running `mycommand.exe` 10 times, starting with `input_file_1`, `input_file_2` and so on up to `input_file_10`.
	`#!/bin/bash
	#SBATCH --array=1-50
	mycommand.exe input_file_$SLURM_ARRAY_TASK_ID`

	2. Compressing a folder of 50 .fasta files in parallel
	`#!/bin/bash
	#SBATCH --array=0-49
	FILES=(*.fasta)
	pigz ${FILES[$SLURM_ARRAY_TASK_ID]}`
	- retrieved a list of the .fasta files in the current directory and stored them in a Bash array variable called `FILES`
	- run `pigz` on each element within that array (`${FILES[0]}, ${FILES[1]}`, etc)

- Produce a separate `.out` file for each task: if job had an ID of 25000, output files called `slurm-25000_0.out`, `slurm-25000_1.out` and so on.


## Transfer files

- `scp` Creates a copy, if using `-r` option copies entire directories and its contents.
	From Local computer terminal use the commands:

	- Local client --> `gruffalo`
	`$ scp -r /path/to/source ncontrer@gruffalo.cropdiversity.ac.uk:/path/to/destination`
		Test: `scp /home/naco/test.txt ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/.`

	- `gruffalo` --> local client
	`$ scp -r ncontrer@gruffalo.cropdiversity.ac.uk:/path/to/source /path/to/destination`
		Test: `scp ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/test1.txt /home/naco/.`

- Synchronizes files and folders between a source and a destination `rsync` check docs for use.


## Cancelling a job
- To cancel: use `scancel`, `<jobid>` is the ID for the Job
	`$ scancel <jobid>`

- To delete all jobs
	`$ scancel -u <username>`

## Job summaries
- to retrieve summary info `$ sacct -j <jobid>`
	more detailed infor `$ sacct -j <jobid> --format JobID,MaxVMSize,MaxRSS,NodeList,AllocCPUS,TotalCPU,State,Start,End`
- Lists the current state of the nodes `snodes`

## Helpful params for scripts
These options can either be given on the command line alongside srun and sbatch or inside a job’s script file using #SBATCH. see `man sbatch` form more

- Change working directory, default is the one used to submit the job. .out files will be written there.
	`#SBATCH --chdir=<directory>`

- Email notification when succesful or failed job:
	`
	#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
	#SBATCH --mail-type=END,FAIL
	`
	**be very careful of doing this with large array sizes or you’ll swamp yourself with hundreds or thousands of emails!**

- Job testing: validate batch script, give estimate of when job will start. Then can tweak any requested resources (number of CPUs, amount of memory, etc) and potentially enabling job to start sooner.
	`sbatch --test-only`

- Submitting binaries: run a simple binary command, use  `--wrap`, rather than creating a script.
	`$ sbatch --wrap "pigz hugefile.txt"`


## Allocating resources
Request different resources by passing additional parameters.

### Queues CPU and memory
Can request different resources by passing additional parameters to Slurm. Check https://help.cropdiversity.ac.uk/slurm-policy.html before allocating more resources.
- `short` queue with 8 CPUs and 16 GB of memory
	- interactive job
	`$ srun --partition=short --cpus-per-task=8 --mem=16G --pty bash`
	- batch job
	`#!/bin/bash
	#SBATCH --partition=short
	#SBATCH --cpus-per-task=8
	#SBATCH --mem=16G
	echo "CPUs available: $SLURM_CPUS_PER_TASK"`

### GPU resources
see https://help.cropdiversity.ac.uk/gpu.html for details
