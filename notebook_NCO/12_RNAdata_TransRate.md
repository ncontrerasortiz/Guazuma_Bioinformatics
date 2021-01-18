### Notebook: TransRate

- Title: Transcriptome quality assesment using TransRate
- Date: 18 Jan 2021
- Wd: in HPC `scratch/private/transcriptome/transrate`
- What/Why: Software for de-novo transcriptome assembly quality analysis (CKidner recommended).
- Further docs:
  - [transrate url](https://hibberdlab.com/transrate/index.html)
--------------------------------------------------------------
- Code and setup:

--------------------------------------------------------------
- Results:

--------------------------------------------------------------
- Extras
  - Installation workaround when "could not find snap in the path" ERROR prompt:
  `conda create -n transrate-app #create an environment, not necessary but to lazy to install outside in the main
  conda activate transrate-app #Needed to run this app in this environ
  conda install -c bioconda transrate
  conda install -c bioconda sn
  ap-aligner #if ERROR: "could not find snap in the path", then need to install snap-aligner
  transrate --assembly transcripts.fa #worked!`
