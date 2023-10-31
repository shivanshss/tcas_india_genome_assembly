export PATH="/softwares/FastQC0.11":$PATH
export PATH="/softwares/softwares/trimmomatic/bin/":$PATH


fastqc -o /home/dagashe/shivanshss/fastQC --extract /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/M_Adult_1.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/M_Adult_2.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/F_Adult_1.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/F_Adult_2.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/C_eggs_1.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/C_eggs_2.fq.gz


java -jar /softwares/softwares/trimmomatic/bin/trimmomatic.jar PE /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/M_Adult_1.fq.gz  /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/M_Adult_2.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_M_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FU_M_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_M_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RU_M_Adult.fastq.gz ILLUMINACLIP:/softwares/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

java -jar /softwares/softwares/trimmomatic/bin/trimmomatic.jar PE /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/F_Adult_1.fq.gz  /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/F_Adult_2.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_F_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FU_F_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_F_Adult.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RU_F_Adult.fastq.gz ILLUMINACLIP:/softwares/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

java -jar /softwares/softwares/trimmomatic/bin/trimmomatic.jar PE /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/C_eggs_1.fq.gz  /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/C_eggs_2.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_C_eggs.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FU_C_eggs.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_C_eggs.fastq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RU_C_eggs.fastq.gz ILLUMINACLIP:/softwares/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36



fastqc -o /home/dagashe/shivanshss/fastQC --extract /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_M_Adult.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_M_Adult.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_F_Adult.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_F_Adult.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_C_eggs.fq.gz /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_C_eggs.fq.gz


mkdir /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 21 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_21 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k21.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k21.err

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 23 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_23 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k23.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k23.err

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 25 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_25 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k25.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k25.err

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 27 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_27 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-trans_output/SOAP_k27.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k27.err

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 29 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_29 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-trans_output/SOAP_k29.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k29.err

/home/dagashe/shivanshss/tools/SOAPdenovo-Trans/SOAPdenovo-Trans-31mer all -K 31 -p 32 -s /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP.config -o /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_31 1>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-trans_output/SOAP_k31.log 2>/home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_k31.err



mkdir /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files

for f in /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_*; do cp /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAPdenovo-Trans_output/SOAP_*.scafSeq /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/; done

cd /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files
for f in *.scafSeq; do mv $f $(echo $f | sed 's/.scafSeq/.fasta/g'); done



export PATH="/home/dagashe/shivanshss/tools/v1.12-r6/bin/":$PATH

#Run GapCloser
cd /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files
for f in *.fasta; do GapCloser -b /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/GapCloser.config -a $f -o GapClosed_$f -l 150 -t 24 1>GapCloser_$f.log 2>GapCloser_$f.err; done


export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/bin/":$PATH

export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/scripts/":$PATH

export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/config/":$PATH

export PATH="/home/dagashe/shivanshss/tools/busco/bin/busco/":$PATH

export AUGUSTUS_CONFIG_PATH=/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/config



busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_21 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_21.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_21_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_21_busco_insect.err

busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_23 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_23.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_23_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_23_busco_insect.err


busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_25 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_25.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_25_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_25_busco_insect.err

busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_27 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_27.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_27_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_27_busco_insect.err

busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_29 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_29.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_29_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_29_busco_insect.err

busco -o /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_31 -i /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/SOAP_31.fasta -l insecta_odb10 -m tran  --augustus --offline -c 32 -f --config /home/dagashe/shivanshss/tools/busco/config/config_update.ini 1> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_31_busco_insect.log 2> /home/dagashe/shivanshss/transcriptome_assembly/BUSCO_output/JNS_SOAP_31_busco_insect.err



export PATH="/softwares/bowtie2-2.3.0/":$PATH


cd /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/
for f in *.fasta; do bowtie2-build $f /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/${f%.*}_bowtie; done

cd /home/dagashe/shivanshss/transcriptome_assembly/JNS_RNAseq/SOAP_assembly_fasta_files/

for f in *.fasta; do bowtie2 -q --phred33-quals -N 1 --sensitive -p 20 --mm -x ${f%.*}_bowtie -1 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_M_Adult.fq.gz -2 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_M_Adult.fq.gz -S $f_M.sam 1>bowtie_$f_M_backmapped.log 2>bowtie_$f_M_backmapping.err && samtools view -bS $f_M.sam > $f_M.bam && rm $f_M.sam; done


for f in *.fasta; do bowtie2 -q --phred33-quals -N 1 --sensitive -p 20 --mm -x ${f%.*}_bowtie -1 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_F_Adult.fq.gz -2 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_F_Adult.fq.gz -S $f_F.sam 1>bowtie_$f_F_backmapped.log 2>bowtie_$f_F_backmapping.err && samtools view -bS $f_F.sam > $f_F.bam && rm $f_F.sam; done



for f in *.fasta; do bowtie2 -q --phred33-quals -N 1 --sensitive -p 20 --mm -x ${f%.*}_bowtie -1 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/FP_C_eggs.fq.gz -2 /home/dagashe/shivanshss/samples_fastq/JNS_RNAseq/trimmed/RP_C_eggs.fq.gz -S $f_eggs.sam 1>bowtie_$f_eggs_backmapped.log 2>bowtie_$f_eggs_backmapping.err && samtools view -bS $f_eggs.sam > $f_eggs.bam && rm $f_eggs.sam; done


for f in *.bam; do samtools flagstat $f > $f_flagstat.txt; done
