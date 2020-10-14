# Data MegaPaftol353: an extended version of Paftol 353

Using MegaPaftol353 from [chrisjackson-pellicle/
NewTargets] (https://github.com/chrisjackson-pellicle/NewTargets)

Subsampling Malvaceae and Malvales

Script `filter_mega353.py` to subsample the `mega353.fasta`

1. Installation of dependencies in CropHPC

    `conda install <package name>`
    <p>Python 3.8.3 (already installed)
    <p>BioPython 1.78 (new)
    <p>pandas 1.1.3 (new)
	<p>EXONERATE 2.4.0 (new)
	<p>HMMER 3.3.1 (new)
	<p>MAFFT 7.471 (new)

2.  NewTargets package installation
	<p>In $APPS scratch are of CropHPC
	<p> `git clone https://github.com/chrisjackson-pellicle/NewTargets.git` (as for 13-10-2020)

3. Scripts

- Input
<p>`mega353.fasta` Expanded Angiosperm353
<p>`select_Malvaceae.txt` and `select_Malvales.txt` To retain only Malvaceae/Malvales from mega353

- Command
<p>`$ srun --pty bash`
<p>`python filter_mega353.py mega353.fasta select_Malvaceae.txt -filtered_target_file malvaceae2_targetfile.fasta -report_filename malvaceae2_report.csv`
<p>`exit` To exit the interactive job allocated in CropHPC

- Output
<p>`malvaceae_targetfile.fasta`: The filtered target file, corresponding to IDs in the select_file
<p>`malvaceae_report.csv`: listing samples with sequences retained in the filtered target file (excluding default Angiosperms353 samples)

- Download csv of report
<p>`scp -r ncontrer@gruffalo.cropdiversity.ac.uk:/mnt/shared/scratch/ncontrer/apps/NewTargets/output1/malvaceae_report.csv /home/naco`

4. Filtered results counting number of sequences in files

<p>`grep ">" malvaceae2_targetfile.fasta | wc -l`
<p>`grep -c "^>" malvales_targetfile.fasta`

5. See results in `Notebook_NCO`

