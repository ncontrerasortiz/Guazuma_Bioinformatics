04_CropDiversityHPC_gettingaround.md

# Slurm: for data analysis
Nodes are named in the form
`nYY-CPU-MEM-name`  
`n19-32-192-hulk`
purchased in 2019-has 32 CPU cores-192 GB of memory-named hulk
All nodes (except Cortana) actual CPU count is doubled: 64 ‘CPUs’ are available for use on hulk.

-Slurm Shortcuts and aliases: https://help.cropdiversity.ac.uk/slurm-shortcuts.html

## General Commands
- Manual `man slurm`
- `sbatch` and `srun` to initiate jobs
- `squeue` to report status of job (R=active, PD=waiting)
- List available resources `sinfo -N` : unused (idle), partially used by running jobs (mix) or completed occupied (alloc). An offline node will shown as down.
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

- Submit the job `$ sbatch test.sh`
	- Output and error information printed to the screen are merged together into a file name: 
		`--error=<filename pattern>` 
		`--output=<filename pattern>`
	- `sbatch test.sh --error=testerror --output=testoutput`