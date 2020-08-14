# Crop Diversity HPC (Cluster): Instructions to connect

- Connect faster (after editing ssh config file see 3. below):
	`ssh gruffalo`
- Logout `exit`

1. Credentials
User login: ncontrer
Display name: Natalia Contreras Ortiz
Home directory: `/home/ncontrer`
Email address: ncontrerasortiz@rbge.org.uk
Random password: 4Gz}f&qIZP?XKP|YRn0N;2
Department Number: rbge

Password of local key: `natalicon1`

2. SSH connection with gruffalo 
`ssh ncontrer@gruffalo.cropdiversity.ac.uk`

`ECDSA key fingerprint is SHA256:ORFcun5bSbLPQ8uCW/R1yqvXbfvhHGuDWkSzRhHARzY`

3. Editing ssh config file in `~/.ssh/config`
	- `touch ~/.ssh/config`
	- `chmod 600 ~/.ssh/config`
	- `Host gruffalo
  			Hostname gruffalo.cropdiversity.ac.uk
 			 User ncontrer `
