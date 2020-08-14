# Crop Diversity HPC (Cluster) overview
- Credentials
User login: ncontrer
Display name: Natalia Contreras Ortiz
Home directory: /home/ncontrer
Email address: ncontrerasortiz@rbge.org.uk
Random password: 4Gz}f&qIZP?XKP|YRn0N;2
Department Number: rbge

- data storage: https://help.cropdiversity.ac.uk/data-storage.html
- Slurm: https://help.cropdiversity.ac.uk/slurm-overview.html
- Slurm policy: https://help.cropdiversity.ac.uk/slurm-policy.html

### Gruffalo
you should only use the head node (gruffalo) for tasks such as job submission and monitoring - it doesn’t have the resources available to support heavy workloads.
All data analysis programs and computational workloads must be run using Slurm. 

### Slurm
Cluster jobs are managed using the Slurm Workload Manager (https://slurm.schedmd.com/). All data analysis programs and computational workloads must be run using Slurm. You should only use the head node (gruffalo) for tasks such as job submission and monitoring
- Slurm is responsible for accepting, scheduling, dispatching, and managing the execution of jobs submitted to the cluster.
- You put the commands you want to run into a script file, submit that script to the cluster’s queue (of jobs)

- Slurm manual
` man slurm`

### Storage

- The cluster has approximately 1.5 PB of storage available

- Most user-accessible folders are found under `/mnt/shared`: intermediate and/or working data, and especially for large throwaway files which either do not need to be kept or can easily be regenerated.

- You must contact an administrator when starting a new project

- All important project data should be kept in /mnt/shared/projects

- Intermediate working data should be kept on a scratch drive

- Please restrict data in /home to small and/or miscellaneous files; total usage here should be under 10 GB

- check your current data usage: https://help.cropdiversity.ac.uk/monitoring.html
 
- important Institute-related project data should be stored in `/mnt/shared/projects`
