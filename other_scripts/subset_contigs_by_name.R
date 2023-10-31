if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("Biostrings")

library(Biostrings)

sequences <- readDNAStringSet('/media/bloodmark/HDD6_SS_extra/DiscoverY/contigs/contigs_01B.fasta')

sequence_names <- readLines('/media/bloodmark/HDD6_SS_extra/DiscoverY/Final_plots/01B_y_contig_names.txt')

# Subset the sequences
selected_sequences <- sequences[names(sequences) %in% sequence_names]

# Write the selected sequences to a new multifasta file
writeXStringSet(selected_sequences, file = '01B_y_contigs.fasta')
