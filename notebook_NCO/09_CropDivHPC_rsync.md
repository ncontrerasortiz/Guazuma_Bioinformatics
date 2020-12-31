### Notebook using rsync in HPCrop

- Title: Download data using rsync
- Date: 30 Dec 2020
- Wd: 
- What/Why: rsync supports resuming an interrupted transfer
- Further docs: HPCropDiv https://help.cropdiversity.ac.uk/file-transfers.html?highlight=rsync
- Code:
1. `screen -S transfer_download`
2. `rsync -avP --partial ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/originals/* /media/naco/Data_storage_backup2/Data_01062019/Guazuma/Transcriptomes/RNA_Guazuma_RBGE/data`
- Then, to resume download
`rsync -avP --partial --append-verify ncontrer@gruffalo.cropdiversity.ac.uk:/home/ncontrer/projects/rbge/Guazuma/data/raw/RNA_RBGE_guazuma/originals/* /media/naco/Data_storage_backup2/Data_01062019/Guazuma/Transcriptomes/RNA_Guazuma_RBGE/data`

You can just interrupt rsync --partial using Ctrl + z if you use rsync --append-verify when resuming

- Results:  `-avP` download archives with permissions and everything and plus see the progress of download
