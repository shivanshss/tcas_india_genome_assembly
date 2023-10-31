mkdir /home/dagashe/shivanshss/ragtag_output/
mkdir /home/dagashe/shivanshss/ragtag_output/1_01A_ont_scaff/

/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/RagTag/ragtag.py scaffold /home/dagashe/shivanshss/new_genomes/pubref_only_chr.fasta /home/dagashe/shivanshss/new_genomes/da01a_ragtagCorr_contigs.fasta -C -f 100 -d 100 --aligner /home/dagashe/shivanshss/tools/minimap2/minimap2 -o /home/dagashe/shivanshss/ragtag_output/1_01A_ont_scaff/ --remove-small -C

mkdir /home/dagashe/shivanshss/tgs_gap_closer/

mkdir /home/dagashe/shivanshss/tgs_gap_closer/1_12B/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/ragtag_output/1_01A_ont_scaff/ragtag.scaffold.fasta --reads /home/dagashe/shivanshss/final_contigs/12B_pilon_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/1_12B/1_12B --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/2_12D/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/1_12B/1_12B.scaff_seqs --reads /home/dagashe/shivanshss/final_contigs/12D_purge_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/2_12D/2_12D --ne --samtools /softwares/samtools-1.9/samtools

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/3_12E/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/2_12D/2_12D.scaff_seqs --reads /home/dagashe/shivanshss/final_contigs/12E_contigs_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/3_12E/3_12E --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/4_13C/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/3_12E/3_12E.scaff_seqs --reads /home/dagashe/shivanshss/final_contigs/13C_ragtagCorr_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/4_13C/4_13C --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/5_13E/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/4_13C/4_13C.scaff_seqs --reads /home/dagashe/shivanshss/final_contigs/13E_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/5_13E/5_13E --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/6_18A/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/5_13E/5_13E.scaff_seqs --reads /home/dagashe/shivanshss/final_contigs/18A_purge_contigs.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/6_18A/6_18A --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

mkdir /home/dagashe/shivanshss/tgs_gap_closer/7_ont/

/softwares/TGS-GapCloser/TGS-GapCloser.sh --scaff /home/dagashe/shivanshss/tgs_gap_closer/6_18A/6_18A.scaff_seqs --reads /home/dagashe/shivanshss/samples_fastq/beetle/nanopore/processed_reads/combined_processed/canu_step2_corr.trimmedReads.fasta --output /home/dagashe/shivanshss/tgs_gap_closer/7_ont/7_ont --ne --samtools /softwares/samtools-1.9/samtools 

rm done_step*

cp /home/dagashe/shivanshss/tgs_gap_closer/7_ont/7_ont.scaff_seqs /home/dagashe/shivanshss/new_genomes/tcas6_finalGapfillScaffCorr.fasta


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/RagTag/ragtag.py scaffold /home/dagashe/shivanshss/reference/beetles/chromosomes/NC_007416.3.fasta /home/dagashe/shivanshss//new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa -C -f 100 -d 100 --aligner /home/dagashe/shivanshss/tools/minimap2/minimap2 -o /home/dagashe/shivanshss/ragtag_output/LGX --remove-small -C

