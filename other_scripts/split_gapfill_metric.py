#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 23 21:59:28 2023

@author: bloodmark
"""

input_file = "/media/bloodmark/HDD6_SS_extra/tgs_gap_closer/7_ont/7_ont.gap_fill_detail"

with open(input_file, 'r') as file:
    lines = file.readlines()

output_files = {}
current_output_file = None

for line in lines:
    if line.startswith(">"):
        # Close the current output file if it exists
        if current_output_file:
            current_output_file.close()

        # Create a new output file with the filename
        filename = line.strip().replace(">", "") + ".txt"
        current_output_file = open(filename, 'w')
        output_files[filename] = current_output_file

    if current_output_file:
        current_output_file.write(line)

# Close all output files
for output_file in output_files.values():
    output_file.close()

print("Files have been split and saved.")
