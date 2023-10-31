install.packages("dplyr")

# Load the required packages
library(dplyr)
library(readr)
library(data.table)

# Read the TSV file (file1) into a data frame
file1 <- fread("/home/bloodmark/workarea/20231011_maker/chr4_split.tab", sep = "\t", header = TRUE)

# Replace blank spaces with "NA" in file1
file1[file1 == ""] <- "NA"

# Read the CSV file (file2) into a data frame
file2 <- read.csv("/home/bloodmark/workarea/20231011_maker/chr4_non_gi_gene_names.txt", header = TRUE)

# Remove "name=" from column 6 in file1
file1$split_data_df.Col2 <- gsub("Name=", "", file1$split_data_df.Col2)

# Rename the column in File2 to match the column in File1
colnames(file2)[colnames(file2) == "Accession.Number"] <- "split_data_df.Col2"


# Perform a left join to merge the data frames
merged_data <- left_join(file1, file2, by = "split_data_df.Col2", relationship = "many-to-many")

# Fill missing values with 'NA'
merged_data[is.na(merged_data$gene_name), "Gene.Name"] <- "NA"

# Remove duplicate rows
merged_data <- distinct(merged_data)

# Write the result to a new file with the same format
write.table(merged_data, "chr4.gff", sep = "\t", row.names = FALSE)
