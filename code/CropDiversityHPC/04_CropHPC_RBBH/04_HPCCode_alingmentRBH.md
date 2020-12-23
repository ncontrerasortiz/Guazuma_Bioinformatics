## Align RBBH (shared sequences) between MegaPaftol and T cacao

### Using Mafft v7.471 (see https://mafft.cbrc.jp/alignment/software/algorithms/algorithms.html#GLE)
1. Combine fasta files into one
 	- `combined_dbqueryhits.fasta`
 	- check final number of sequences: 335 + 335 = 670 OK

2. Run mafft using sbatch script job in the cluster
	- sbatch mafftAln.sh, (4) Fasta format / Input order
		1. Strategy G-INS-i (Very slow; recommended for <200 sequences with global homology) Global
			- Command:
				`"/mnt/shared/scratch/ncontrer/apps/conda/bin/mafft"  --globalpair --maxiterate 16 --inputorder "combined_dbqueryhits.fasta" > "combined_dbqueryhits_G-INS-i.fasta"`
				- slurm-292545.out
		2. Strategy FFT-NS-2 (Fast; progressive method)
			- Command: `"/mnt/shared/scratch/ncontrer/apps/conda/bin/mafft"  --retree 2 --inputorder "combined_dbqueryhits.fasta" > "combined_dbqueryhits_FFT-NS-2.fasta"`
				- This aln is too bad, many gaps, doesn't work
		3. Strategy L-INS-i (Very slow; recommended for <200 sequences with one conserved domain and long gaps). Input seqs are assumed to have only one alignable domain. Local
			- Command: `"/mnt/shared/scratch/ncontrer/apps/conda/bin/mafft" --localpair  --maxiterate 16 --inputorder "combined_dbqueryhitscopy.fasta" > "combined_dbqueryhits_L-INS-i.fasta"`
				- Submitted batch job 292837
		4.  Strategy L-INS-i: But align query RBBH to T. cacao genome (query)???



from Couvreur et al 2019 (https://doi.org/10.3389/fpls.2018.01941)
Accuracy oriented method
G-INS-i: suitable for sequences of similar lengths; recommended for <200 sequences; iterative refinement method incorporating global pairwise alignment information

resulting alignments were trimmed using BMGE (v1.12) (Criscuolo and Gribaldo, 2010) to remove sites with more than 50% gaps.

