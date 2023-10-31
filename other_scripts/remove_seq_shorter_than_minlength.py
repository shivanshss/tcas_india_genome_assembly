#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 20:48:58 2023

@author: bloodmark
"""

def filter_and_write_fasta(input_file, output_file, min_length=1000):
    try:
        with open(input_file, 'r') as fasta_file, open(output_file, 'w') as output:
            sequence_name = ''
            sequence = ''
            for line in fasta_file:
                line = line.strip()
                if line.startswith('>'):
                    if sequence_name:
                        if len(sequence) >= min_length:
                            output.write(f'{sequence_name}\n{sequence}\n')
                    sequence_name = line
                    sequence = ''
                else:
                    sequence += line
            # Write the last sequence
            if sequence_name and len(sequence) >= min_length:
                output.write(f'{sequence_name}\n{sequence}\n')
        print(f"Sequences longer than {min_length} bases written to {output_file}")
    except FileNotFoundError:
        print("File not found. Please check the file path.")

# Replace 'input.fasta' and 'corrected.fasta' with your file paths
input_file = '/media/bloodmark/HDD6_SS_extra/new_final_chr/Chr0_RagTag_contigs_corrected.fa'
output_file = 'Chr0_RagTag_contigs_corrected_sorted.fa'
filter_and_write_fasta(input_file, output_file)
