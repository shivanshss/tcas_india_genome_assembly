#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 24 18:58:45 2023

@author: bloodmark
"""

# Define the input and output file names
input_file = "/media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/chr/unplaced_contigs.fasta"
output_file = "/media/bloodmark/HDD6_SS_extra/new_final_chr/20231025/chr/unplaced_contigs_scaff.fasta"

merged_sequence_name = "unplaced_contigs"

# Initialize the merged sequence
merged_sequence = ""

# Open the input and output files
with open(input_file, "r") as infile, open(output_file, "w") as outfile:
    for line in infile:
        if line.startswith(">"):
            # Skip header lines
            continue
        # Concatenate the sequence lines
        merged_sequence += line.strip()

    # Write the merged sequence with the custom name
    outfile.write(f">{merged_sequence_name}\n{merged_sequence}\n")