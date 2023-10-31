cat /media/bloodmark/HDD6_SS_extra/new_genomes/new_final_chr/tcas6_finalGapfillScaffCorr.fasta | awk '{
        if (substr($0, 1, 1)==">") {filename=(substr($0,2) ".fa")}
        print $0 > filename
}'

cat /media/bloodmark/HDD6_SS_extra/new_genomes/new_final_chr/Chr0_RagTag.fa              \
    | seqkit fx2tab        \
    | cut -f 2             \
    | sed -r 's/n+/\n/gi'  \
    | cat -n               \
    | seqkit tab2fx        \
    | seqkit replace -p "(.+)" -r "Contig{nr}" > Chr0_RagTag_contigs.fa


blastn -query file2.fasta -subject file1.fasta -outfmt "6 qseqid sseqid pident" -out blast_results.txt

awk '$3 >= 80' blast_results.txt | cut -f1 | sort | uniq > matching_sequence_ids.txt

awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids.txt file2.fasta > file3.fasta



#/home/dagashe/shivanshss/tools/ncbi-blast-2.13.0+/bin/blastn -query /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs.fa -subject /home/dagashe/shivanshss/new_genomes/new_final_chr/tcas6_finalGapfillScaffCorr_chr.fasta -outfmt "6 qseqid sseqid pident length qlen slen" -out blast_results_chr0_tcas6Chr_top5.txt -max_target_seqs 5

#awk '$3 >= 80 && $4 >= 200' blast_results_chr0_tcas6Chr_top5.txt | cut -f1 | sort | uniq > matching_sequence_ids.txt


#awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids.txt /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs.fa > /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa

#awk '$3 > 80 && ($4 / $5) > 0.8' blast_results_chr0_tcas6Chr_top5.txt | cut -f1 | sort | uniq > matching_sequence_ids.txt


#awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids.txt /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs.fa > /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa

awk '$3 > 80 && ($4 / $5) > 0.8 && $5 >= 1000' blast_results_chr0_tcas6Chr_top5.txt | cut -f1 | sort | uniq > matching_sequence_ids.txt



awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids.txt /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs.fa > /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa

    
/home/dagashe/shivanshss/tools/ncbi-blast-2.13.0+/bin/blastn -query /home/dagashe/shivanshss/new_genomes/new_final_chr/Y_contigs_all.fasta -subject /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa -outfmt "6 qseqid sseqid pident length qlen slen" -out blast_results_chr0_tcas6_ycontigs_top5.txt -max_target_seqs 5


awk '$3 > 80 && ($4 / $5) > 0.8 && $5 >= 1000' blast_results_chr0_tcas6_ycontigs_top5.txt | cut -f1 | sort | uniq > matching_sequence_ids_2.txt



awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids_2.txt /home/dagashe/shivanshss/new_genomes/new_final_chr/Chr0_RagTag_contigs_corrected.fa > /home/dagashe/shivanshss/new_genomes/new_final_chr/unplaced_contigs.fa


