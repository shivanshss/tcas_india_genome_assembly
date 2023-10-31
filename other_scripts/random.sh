awk '!/^>/ {a_count+=gsub(/[ATGCN]/, ""); t_count+=gsub(/[atgcn]/, ""); g_count+=gsub(/[ATGCN]/, ""); c_count+=gsub(/[atgcn]/, ""); n_count+=gsub(/[ATGCN]/, "")} END {print "Total A:", a_count, "T:", t_count, "G:", g_count, "C:", c_count, "N:", n_count}' 


awk '!/^>/ {a_count+=gsub(/[AT]/, ""); t_count+=gsub(/[at]/, ""); g_count+=gsub(/[GCgc]/, ""); c_count+=gsub(/[gc]/, ""); n_count+=gsub(/[Nn]/, "")} END {print "Total A:", a_count, "T:", t_count, "G:", g_count, "C:", c_count, "N:", n_count}' your_multifasta.fasta

scp -r /media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/ shivanshss@tiramisu:/home/dagashe/shivanshss/new_genomes/new_final_chr/

