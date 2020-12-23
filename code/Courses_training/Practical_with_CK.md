Practical with CK
bowtie2
samtools


1. Forward and reverse file -1 -2 and md5 files to check if file tranfer has gone correctly... not corrupted.
2. md5sum: generates a new md5 file and code to know if files are corrupted.
diff tmpfile originalfile
	1. md5sum file > tmpmd5.txt
		- validate multiple files at a time:
		`md5sum file1.txt file2.txt file3.txt > tmpm5.txt`
	2. `diff tmpmd5.txt md5file.txt`
	3. No output no difference, check


3. zcat fastq.gz | head -5 : To see the files

4. Trimmomatic

cat trimmomatic_command.txt 
trimmomatic PE -phred33 ~/projects/rbge/Inga/Inga_umb_1932_col/NEB_Lib11a+/150529_M01270_0107_000000000-AE4YU_1_NB-TP-007_1.sanfastq.gz ~/projects/rbge/Inga/Inga_umb_1932_col/NEB_Lib11a+/150529_M01270_0107_000000000-AE4YU_1_NB-TP-007_2.sanfastq.gz output_forward_paired.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36


grep "Surviving"

6. history | grep scp #to check last time I use scp

7. Fastqc

8. Cut adapt to cut the adapters more


cutadapt -a AGATCGGAAGAG -A AGATCGGAAGAG -o tr_R1.fastq -p tr_R2.fastq R1.fastq R2.fastq.

-o output -p pairedreads_file input1 input2

cutadapt -a AGATCGGAAGAG -A AGATCGGAAGAG -o tr_R1.fastq -p tr_R2.fastq output_forward_paired.fq.gz output_reverse_paired.fq.gz