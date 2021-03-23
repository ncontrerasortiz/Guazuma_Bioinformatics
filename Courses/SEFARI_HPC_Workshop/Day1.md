# SEFARI HPC Workshop Day 1
###Introduction to the cluster and linux
`squeue` see the queue and what is running  
`srsh -p debug` Submit an interactive job  
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
-
