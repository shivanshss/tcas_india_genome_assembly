#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")

#BiocManager::install("karyoploteR")
#BiocManager::install("Biostrings")

library(karyoploteR)
library(Biostrings)
library(colorspace)
library(circlize)
library(RColorBrewer)

# Sample data parsing (replace with actual data reading and processing)
sv_data <- read.table("/home/bloodmark/workarea/20231025/LG5/align_out_indels.txt", header = FALSE, sep = "\t", fill = T)

#head(sv_data)
# Read the data from the file

# Remove the last two columns
#sv_data <- sv_data[, 1:(ncol(sv_data) - 2)]

# If you want to remove the last two columns for display purposes, you can use head()
head(sv_data)

colnames(sv_data) <- c("Scaffold", "Type", "start", "end", "Size")

# Remove rows where start is less than end
#sv_data <- sv_data[sv_data$start >= sv_data$end, ]
sv_data <- sv_data[sv_data$Size >= 1, ]
sv_data <- na.omit(sv_data)

#fasta_file <- readDNAStringSet("/media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/NC_007417.3_RagTag.fa")
#chromosome_names <- names(fasta_file)
#chromosome_lengths <- width(fasta_file)

#custom_genome <- data.frame(
#  chromosome = chromosome_names,
#  length = chromosome_lengths
#)

# Load the ggplot2 package
library(ggplot2)

# Determine the number of unique values in sv_data$Type
num_unique_types <- length(unique(sv_data$Type))

# Choose a custom color palette with dark, easily visible colors
custom_palette <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f")

# Create a linear chromosome plot
chromosome_plot <- ggplot(sv_data, aes(x = start, xend = end, y = Type, color = Type)) +
  geom_segment(aes(yend = Type, size = Size)) +
  scale_color_manual(values = custom_palette) +
  scale_size_continuous(range = c(1, 10)) +
  theme_minimal() +
  labs(x = "Position on Chromosome", y = "Feature Type") +
  scale_y_discrete(limits = unique(sv_data$Type))  # Set a common y-axis scale
  
# Display the plot
print(chromosome_plot)
