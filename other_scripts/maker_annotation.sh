
mkdir /home/dagashe/shivanshss/final_maker

cd /home/dagashe/shivanshss/final_maker

MY_GENOME=/home/dagashe/shivanshss/new_genomes/tcas6_finalGapfillScaffCorr.fasta
MY_TRANSCRIPTOME=/home/dagashe/shivanshss/download27/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_31.fasta
MY_PROTEINS=/home/dagashe/shivanshss/uniprot_sprot.fasta

/home/dagashe/shivanshss/tools/busco/bin/busco -i /home/dagashe/shivanshss/new_genomes/tcas6_finalGapfillScaffCorr.fasta -l insecta_odb10 -o busco_tcas6 --long -m genome --augustus --offline --config /home/dagashe/shivanshss/tools/busco/config/config_tcas6


export PATH=/home/dagashe/shivanshss/tools/RepeatModeler-2.0.3:$PATH
export PERL5LIB=/softwares/perl5.30.0/lib/
export PERL5LIB=/home/dagashe/shivanshss/perl5/lib
export PERL5LIB=/home/dagashe/shivanshss/perl5/lib/perl5

BuildDatabase -name genome_db -engine ncbi $MY_GENOME

RepeatModeler -pa 32 -engine ncbi -database genome_db 2>&1 | tee repeatmodeler.log

#################################################################################################################################################
REPEATMASKER_LIB_DIR=/home/dagashe/shivanshss/tools/RepeatMasker/Libraries

REPEATMASKER_MATRICES_DIR=/home/dagashe/shivanshss/tools/RepeatMasker/Matrices

export PATH=/home/dagashe/shivanshss/tools/RepeatMasker/:$PATH


mkdir repeatMasker-tcas_model

RepeatMasker -pa 24 -e ncbi -gccalc 
[-lib combined-conseni.fa.classified #concatenated consensi.fa.classified and RepBase files]
-dir repeatMasker-model $MY_GENOME

mkdir repeatMasker-output

repeat_species=arthropoda

RepeatMasker -pa 24 -e ncbi -gccalc -a -species $repeat_species -dir repeatMasker-output $MY_GENOME 

mkdir full_mask

gunzip repeatMasker-output/*.cat.gz 

cat repeatMasker-output/*.cat.gz > full_mask/full_mask.cat

cd full_mask

ProcessRepeats -species arthropoda full_mask.cat

# create GFF3
rmOutToGFF3.pl full_mask/full_mask.out > full_mask/full_mask.out.gff3


# isolate complex repeats
grep -v -e "Satellite" -e ")n" -e "-rich" full_mask.out.gff3 > full_mask.out.complex.gff3

# reformat to work with MAKER
cat full_mask.out.complex.gff3 | perl -ane '$id; if(!/^\#/){@F = split(/\t/, $_); chomp $F[-1];$id++; $F[-1] .= "\;ID=$id"; $_ = join("\t", @F)."\n"} print $_' > full_mask.out.complex.reformat.gff3

complex_repeats=full_mask.out.complex.reformat.gff3































