# Blast


0. Merge files into one

`cat CORTEXS_KZ0AAT.fasta CORTINS_KZ0AAV.fasta Drought_KZ0ACAF.fasta LEAVES_KZ0ABE.fasta STEMS_KZ0AAA.fasta > ./KZ0A_leavcortexstem.fasta`

1. Create a custom database from the multi-FASTA EST file of sequences:

`makeblastdb -in Theobroma_cacaoV2_annot_cds.fasta -dbtype nucl`

2. Perform the blast 

2.1 Test with `-evalue 1e-50`:

- First with outfmt 6, 7 and 8:

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsSeqalign.out -evalue 1e-50 -outfmt 8`

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsTab.out -evalue 1e-50 -outfmt 6`

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsTabComm.out -evalue 1e-50 -outfmt 7`

- Now normal default output
`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out results.out -evalue 1e-50`


2.2 Test with `-evalue 10` default:

- First with outfmt 6, 7 and 8:

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsSeqalign.out -outfmt 8`

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsTab.out -outfmt 6`

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out resultsTabComm.out -outfmt 7`

- Now normal default output

`blastn -db ../Theobroma_cacaoV2_annot_cds/Theobroma_cacaoV2_annot_cds.fasta -query ../EST_libraries/KZ0A_leavcortexstem.fasta -out results.out`