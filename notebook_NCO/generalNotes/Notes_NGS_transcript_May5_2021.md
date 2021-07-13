# Notes for NGS help group 5th May 2021

- *De Bruijn Graph*: A directed mathematical graph that uses a sequence of letters of length k to represent nodes. Pairs of nodes are connected if shifting a sequence by one character creates an exact k–1 overlap between the two sequences.
        - A mathematical approach used to construct the assembly:
        1. short oligonucleaotides of length K are generated from the reads (k-mers), each k-mer is a node
        2. Then pairs of nodes are connected if by connecting them the # of k-mers is reduced
            - single nucleotide changes cause bubbles
            - deletion or insertions introduce shorter paths.
            - Chains of nodes are collapse
            - different paths are different isoforms


- Trinity partitions the sequence data into many individual de Bruijn graphs, each representing the transcriptional complexity at a given gene or locus, and then processes each graph independently to extract full-length splicing isoforms and to tease apart transcripts derived from paralogous genes. 

- *Isoforms*: Different mRNA produced from the same locus

- *FastqScreen*: 
    - One hit/one genome: Reads that map uniquely to the specified genome and not any other genome
    - Multiple hits/one genome: Reads that map to a specified genome, but no uniquely, mapped to two or more separate locations
    - One hit/multiple genome: map uniquely to the specified genome, but also mapped to one or more other specified genomes
    - Multiple hits/multiple genomes: Map to several locations in the genome speciefied, and also to other genomes.
    - no hits