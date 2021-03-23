# Cacao accessions from Cornejo et al paper: (2018) 1:167 | DOI: 10.1038/s42003-018-0168-6 | www.nature.com/commsbio

- Date: 25-02-2021
- Wd:
  - Guazuma/Genomics/Bioinformatics/exploratory/Workshop_cacao
- What/Why: Selection and download of accessions from pop genetics paper (Cornejo et al).
The idea is to select some individuals per population to further construct a phylogeny and perform analyses.
- Further docs:
    - (Suplementary material)[https://static-content.springer.com/esm/art%3A10.1038%2Fs42003-018-0168-6/MediaObjects/42003_2018_168_MOESM1_ESM.pdf] see Fig 3 for phylo tree
    - Paper Cornejo et al 2018 Nature comms
----------------------------------------------------------------------
## Context: Paper
1. Understand what they do in the clustering analyses
  - Pop genetic structure and history, emphasis on domestication
  - accumulation of deleterious mutation in cacao, the influence of domestication in this
  - Sequencing at 22x coverage, high?
  - Criollo: to investigate the evolutionary origin of Criollo, the cacao tree domesticated in Mesoamerica, the most likely representative of the cacao domesticated in Mesoamerica
  - The 10 populations have contributed in recent times to the genetic makeup of crops, the majority of them remain as wild populations
  - Fig 5 is the genetic cluster of some individuals for which productivity has been measured. Done to test if domestication promotes accumulation of deleterious mutations (yes).

    1. Main populations (10 genetic clusters):
      - Contamana
      - Criollo: larger average Fst, clearly different from the others, the one we use today
      - Curaray
      - Nacional
      - Purus
      - Iquitos
      - Nanay
      - Maranon
      - Guianna
      - Amelonado

2. select samples from different clusters: check sra_results_200WGS_cacao.csv
Possible populations to sample from:
  - Criollo
  - Guianna
  - Iquitos
  - Nacional (based on Neighbor-Joining tree from supplementaries, pick the longest and further apart branches, populations)
NEXT: SELECT 2 OR 3 ACCESSIONS PER POPULATION AND DOWNLOAD OR SUBSELECT IN ACCESSIONS
3. Accession ID to NCBI accesion linked
Pop: library_name  
Criollo: sp1, sp3, sp9  (red)
Guianna: GU_114_P, GU_222, GU_175_P (aguamarina)
Iquitos: IMC_47, IMC_12, IMC_20 (blue)
Nacional: AM_1_54, UF273_T1, UF273_T2 (green)
4. Manually search the Run ID in NCBI, using the Sample Accession from sra_results_200WGS_cacao.
5. Create a cp of these run files in CropHPC

#!/bin/bash
#SBATCH --job-name="copy batch"
#SBATCH --export=ALL
#SBATCH --mail-user=ncontrerasortiz@rbge.org.uk
#SBATCH --mail-type=END,FAIL
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774279* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774276* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774275* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774267* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774254* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774270* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774328* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774330* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774274* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774305* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774244* ~/projects/rbge/Guazuma/references/Cacao_workshop/. &
cp ~/projects/rbge/Guazuma/references/200WG_cacao/SRR7774245* ~/projects/rbge/Guazuma/references/Cacao_workshop/.
echo "Job finished"

02 Marzo 2021
40mil horas de cluster
Curso latinoamerica 20 personas

Division de temas: Definir Agenda y trabajo

16 Marzo 2021
Cotizaciones de clusters
Plantear piloto de uso de datos en cluster
Mandar archivos a Ana Bossa 