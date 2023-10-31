#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 20:37:03 2023

@author: bloodmark
"""

def count_bases_in_fasta(input_file, output_file):
    try:
        with open(input_file, 'r') as fasta_file, open(output_file, 'w') as output:
            sequence_name = ''
            sequence = ''
            for line in fasta_file:
                line = line.strip()
                if line.startswith('>'):
                    if sequence_name:
                        output.write(f'{sequence_name}\t{len(sequence)}\n')
                    sequence_name = line[1:]
                    sequence = ''
                else:
                    sequence += line
            # Write the last sequence
            if sequence_name:
                output.write(f'{sequence_name}\t{len(sequence)}\n')
        print(f"Base count information written to {output_file}")
    except FileNotFoundError:
        print("File not found. Please check the file path.")

# Replace 'input.fasta' and 'output.txt' with your file paths
input_file = '/media/bloodmark/HDD6_SS_extra/new_final_chr/Chr0_RagTag_contigs_corrected.fa'
output_file = 'Chr0_RagTag_contigs_corrected.hist'
count_bases_in_fasta(input_file, output_file)
