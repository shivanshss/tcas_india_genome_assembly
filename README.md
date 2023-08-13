# tcas_india_genome_assembly

This repository contains files, scripts, and test data for analyses done for chapter 1 of my PhD thesis

[step 1](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step1/step1.README)

1. Quality Control and Preprocessing:

    Perform quality checks on raw Illumina HiSeq DNA sequence data using FastQC v.0.11.8 (Andrews S., 2010).
    Trim adapters from the reads.
    Remove low-quality bases with a score below 3 from the start and end of reads.
    Discard reads with a length less than 80 bases using Trimmomatic v.0.38:
        Parameters: ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:80

2. K-mer Frequency Analysis:

    Use jellyfish / kmc (Marcais and Kingsford, 2011; Kokot et al, 2017) to compute a histogram of kmer frequencies for Illumina short-reads.
    Perform k-mer analysis using GenomeScope2.0 (reference not provided) with default parameters.
    Utilize k-mer analysis results to estimate genome size and assess heterozygosity.

3. Purge-Haplotigs Preparation:

    Gather information from k-mer analysis to identify contigs potentially assembled incorrectly due to heterozygosity.
    Use this information in the later purge-haplotigs step for removing problematic contigs.

4. Illumina Short Read Assembly:

    Assemble Illumina short reads from 3 samples of DA1 and 5 samples from 3 other populations.
    Utilize SPAdes ver3.15.2 (Prjibelski et al, 2020) for assembly, resulting in contigs.

5. Hybrid Assembly:

    Combine assembled contigs with nanopore long reads from a hyper-inbred line.
    Perform hybrid assembly using hybridSPAdes (Antipov et al, 2016).

6. Reference Genome Integration and Chromosome Marking:

    Enhance contig organization using a published reference genome (Richards et al, 2008; Herndon et al, 2020).
    Reorient and rescaffold contigs in the assembled genome.
    Employ RagTag (Alonge, Michael, et al, 2019; 2021) to mark chromosomes.

    

[step 2](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step2/step2.README)

7. Redundant Contig Removal:

    Utilize Purge Haplotigs v1.0.0 (reference not provided) to remove redundant contigs from the hybrid assembly.
    Select parameters ‘-l 5 -m 30 -h 190’ based on coverage histogram output from the initial pipeline step.
    Set the haploid identification cutoff to ‘-a 40’ due to high heterozygosity in short-read sequences.

    

[step 3](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step3/step3.README)

8. Assembly Statistics and Completeness Assessment:
        Calculate assembly statistics using QUAST (Gurevich et al, 2013) and GAEP (a reference not provided).
        Estimate assembly completeness using BUSCO with odb10-Insecta (Simao et al, 2015; database from 20211210).

9. Error Polishing and Further Purging:
        Perform up to 3 rounds of Pilon (reference not provided) error polishing using merged short reads.
        Conduct additional Purge Haplotigs rounds using more sensitive parameters ‘-l 10 -m 50 -h 150’.
        Set the haploid identification cutoff to ‘-a 80’ for increased sensitivity.

10. Chromosome Comparison and Validation:

11. Compare each chromosome with the published reference by aligning using nucmer and mummer (Kurtz et al, 2004; Delcher et al, 2002).

    

[step 4 - Annotation](https://github.com/shivanshss/tcas_india_genome_assembly/blob/main/step4/step4.README)

    
1. Repeat Library Construction:        Construct a de novo species-specific repeat library using RepeatModeller v1.0.7 to identify repeat models.
        Search the repeat models against the GenBank non-redundant (nr) protein database for Arthropoda using Blastx (e value < 10^-3) to remove     potential protein-coding genes.
        Combine the filtered models with transposon data from RepBase to create a custom repeat library.

2. Repeat Masking and Abundance Estimation:
        Employ RepeatMasker v4.0.7 to mask repeats in the genome assembly using the custom repeat libraries.
        Estimate the abundances of all predicted repeats using RepeatMasker.

3. Transcriptome-Based Assembly:
        Obtain RNA sequencing reads from a closely related population of the beetle (IK and JNS provided RNA sequencing reads).
        Perform de novo transcriptome assembly using SOAPdenovo-Trans at various kmer values ranging from 21 to 141.
        Select the best transcripts from the SOAPdenovo assemblies based on total assembly size and fragmentation levels.

4. Protein Homology-Based Annotation:
        Utilize AUGUSTUS (Stanke and Morgenstern, 2005) and Exonerate (Slater and Birney, 2005) for protein homology-based gene annotation.
        Predict gene structures based on homology to known proteins and genomic alignments.

5. Ab Initio Gene Finding:
        Perform ab initio gene finding based on gene structure, ORF finder, and transcription factor binding sites.
        Use tools such as SNAP (Korf I, 2004) and GlimmerHMM (Majoros et al, 2004) for this purpose.

6. Lifting Over Annotations and Chromosome Annotation:
        Lift over annotations from a published reference genome using Twinscan/N-SCAN (Baren et al, 2007).
        Perform the annotation step for one chromosome at a time.
        Concatenate all unplaced contigs into one unit, treating them as a single chromosome for annotation analysis.
        Add 100 Ns between contigs for cohesion, but do not include these Ns in the counting of gene models.

7. Manual Removal of Overlapping and Redundant Models:
        Manually review the annotated gene models.
        Remove any overlapping and redundant gene models identified during the annotation process.

This annotation process integrates transcriptome evidence, ab initio gene prediction, repeat masking, and reference-based annotations to generate a comprehensive and accurate annotation of the genome. The process involves careful filtering, prediction, and validation steps to ensure high-quality results.
