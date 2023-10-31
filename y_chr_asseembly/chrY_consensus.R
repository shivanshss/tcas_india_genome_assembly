# Install and load the Bioconductor Biostrings package if not already installed
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}
BiocManager::install("Biostrings")

library(Biostrings)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DECIPHER")

library(DECIPHER)

# List of your multifasta files (replace with your file paths)
fasta_files <- c("/home/bloodmark/12B_y_contigs.fasta", "/home/bloodmark/12E_y_contigs.fasta", "/home/bloodmark/13C_y_contigs.fasta", "/home/bloodmark/13E_y_contigs.fasta", "/home/bloodmark/18B_y_contigs.fasta", "/home/bloodmark/18A_y_contigs.fasta")

# Read sequences from the multifasta files
seq_list <- readDNAStringSet(fasta_files)

# Create a multiple sequence alignment
alignment <- AlignSeqs(seq_list)

# Generate a consensus sequence from the alignment
consensus <- Consensus(alignment)

# Set the threshold (at least 3 samples must have a consensus at a position)
threshold <- 2

# Generate the consensus sequence based on the threshold
final_consensus <- CreateConsensus(consensus, threshold)

# Print or save the final consensus sequence
cat(final_consensus)

# Write the consensus sequence to a fasta file
writeXStringSetToFile(DNAStringSet(final_consensus), "chrY_consensus.fasta")

# Calculate summary statistics
num_base_pairs <- length(final_consensus)
num_sequences <- length(seq_list)
base_percentages <- table(final_consensus) / num_base_pairs * 100

# Print or save the summary statistics
cat("Number of Base Pairs:", num_base_pairs, "\n")
cat("Number of Sequences:", num_sequences, "\n")
cat("Base Percentages:\n")
print(base_percentages)
