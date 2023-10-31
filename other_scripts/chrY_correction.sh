/home/dagashe/shivanshss/ragtag_output/chrY

cat /media/bloodmark/HDD6_SS_extra/chrY/ragtag.scaffold.fasta | awk '{
        if (substr($0, 1, 1)==">") {filename=(substr($0,2) ".fa")}
        print $0 > filename
}'

cat /media/bloodmark/HDD6_SS_extra/DiscoverY/scaffolded_chr/Chr0_RagTag.fa              \
    | seqkit fx2tab        \
    | cut -f 2             \
    | sed -r 's/n+/\n/gi'  \
    | cat -n               \
    | seqkit tab2fx        \
    | seqkit replace -p "(.+)" -r "Contig{nr}" > chrY_Chr0_RagTag_contigs.fa
	
	
scp -r /media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/ shivanshss@tiramisu:/home/dagashe/shivanshss/new_genomes/


/home/dagashe/shivanshss/tools/ncbi-blast-2.13.0+/bin/blastn -query /home/dagashe/shivanshss/new_genomes/new_final_chr/20231025/chrY_Chr0_RagTag_contigs.fa -subject /home/dagashe/shivanshss/new_genomes/new_final_chr/20231025/tcas6_chr_unpl.fasta -outfmt "6 qseqid sseqid pident length qlen slen" -out blast_results_Ychr0_tcas6_top5.txt -max_target_seqs 5


awk '$3 > 80 && ($4 / $5) > 0.8 && $5 >= 1000' blast_results_Ychr0_tcas6_top5.txt | cut -f1 | sort | uniq > matching_sequence_ids_Ychr0_tcas6_top5.txt



awk 'BEGIN {RS = ">" ; ORS = ""} NR==FNR {f[$0]; next} !($1 in f) {print ">" $0}' matching_sequence_ids_Ychr0_tcas6_top5.txt /home/dagashe/shivanshss/new_genomes/new_final_chr/20231025/chrY_Chr0_RagTag_contigs.fa > /media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/chrY_Chr0_RagTag_contigs_corr.fa


cat /home/dagashe/shivanshss/new_genomes/20231025/chrY_Chr0_RagTag_contigs_corr.fa /home/dagashe/shivanshss/new_genomes/20231025/y_chr.fasta > /home/dagashe/shivanshss/new_genomes/20231025/y_chr_corr.fasta

cat /home/dagashe/shivanshss/new_genomes/new_final_chr/20231025/tcas6_chr_unpl.fasta /home/dagashe/shivanshss/new_genomes/20231025/y_chr_corr.fasta > /home/dagashe/shivanshss/new_genomes/tcas6_final_all.fasta

/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/RagTag/ragtag.py scaffold /home/dagashe/shivanshss/reference/beetles/chromosomes/lgy.fasta /home/dagashe/shivanshss/new_genomes/new_final_chr/Y_contigs_all.fasta -C -f 100 -d 100 --aligner /home/dagashe/shivanshss/tools/minimap2/minimap2 -o /home/dagashe/shivanshss/ragtag_output/chrY --remove-small -C


