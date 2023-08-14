# tcas_india_genome_assembly
    
Repository Overview

This repository encompasses files, scripts, and test data pertinent to the analyses conducted for the first chapter of my PhD thesis.

In this project, I use Illumina short reads and nanopore long reads to assemble a hybrid reference genome for the beetle, _Tribolium castaneum_. 
Edit the .config file with PATHs to samples and tools and run the script with the config file. The output will be created in new folders (the name of the folder will be the same as the sample name).

Step 1: Quality Control and Preprocessing [step 1](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step1/step1.README)


    Perform quality checks on raw Illumina HiSeq DNA sequence data using FastQC v.0.11.8 (Andrews S., 2010).
    Trim adapters from reads, discard low-quality bases (score < 3) from read ends, and remove reads with length < 80 using Trimmomatic v.0.38.
    Utilize jellyfish/kmc for computing k-mer frequency histogram of Illumina short-reads.
    Employ GenomeScope2.0 for k-mer analysis to estimate genome size and evaluate heterozygosity.
    Use k-mer analysis outcomes to identify contigs potentially misassembled due to heterozygosity.

Step 2: Assembly and Redundant Contig Removal [step 2](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step2/step2.README)

    Assemble reads using Spades
    Apply Purge Haplotigs v1.0.0 to eliminate redundant contigs from hybrid assembly.
    Set parameters ('-l 5 -m 30 -h 190') based on coverage histogram output.
    Adjust haploid identification cutoff ('-a 40') to address high heterozygosity.

Step 3: Assembly Statistics, Completeness, and Polishing [step 3](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step3/step3.README)


    Calculate assembly statistics using QUAST and GAEP.
    Estimate assembly completeness with BUSCO using odb10-Insecta.
    Conduct up to 3 rounds of Pilon error polishing using merged short reads.
    Perform additional rounds of Purge Haplotigs with more sensitive parameters ('-l 10 -m 50 -h 150').
    Set haploid identification cutoff ('-a 80') for heightened sensitivity.
    Compare and validate each chromosome against published reference using nucmer and mummer.

Step 4: Annotation [step 4 - Annotation](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step4/step4.README)


    Construct de novo species-specific repeat library using RepeatModeller v1.0.7.
    Remove potential protein-coding genes by searching repeat models against GenBank nr protein database using Blastx (e value < 10^-3).
    Combine filtered models with transposon data from RepBase to create custom repeat library.
    Apply RepeatMasker v4.0.7 for repeat masking using custom libraries.
    Estimate predicted repeat abundances using RepeatMasker results.
    Acquire RNA sequencing reads from related beetle population for de novo transcriptome assembly.
    Employ SOAPdenovo-Trans for assembly at various kmer values, select superior transcripts.
    Use AUGUSTUS and Exonerate for protein homology-based gene annotation.
    Perform ab initio gene finding using tools like SNAP and GlimmerHMM.
    Transfer annotations from published reference genome using Twinscan/N-SCAN.
    Conduct annotation for one chromosome at a time, concatenating unplaced contigs for analysis.
    Manually review and eliminate overlapping and redundant gene models from annotation outcomes.

This process integrates various steps such as quality control, assembly, filtering, annotation, and validation to ensure comprehensive analysis and accurate annotation of the genome. The process can be adapted for various genomic analyses with suitable modifications.
