#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 24 20:25:36 2023

@author: bloodmark
"""

with open("/home/bloodmark/workarea/20231025/chrY.paf", "r") as paf_file, open("output.bed", "w") as bed_file:
    for line in paf_file:
        # Skip header lines that start with "LN:"
        if line.startswith("LN:"):
            continue
        
        fields = line.strip().split("\t")
        
        # Check if the line has enough fields (at least 12) before processing
        if len(fields) < 12:
            continue
        
        qname, rname = fields[0], fields[5]
        
        # Check if the fields should be treated as integers or strings
        qstart = int(fields[2]) if fields[2].isdigit() else fields[2]
        qend = int(fields[3]) if fields[3].isdigit() else fields[3]
        rstart = int(fields[7]) if fields[7].isdigit() else fields[7]
        mapping_type = fields[4]
        
        # Calculate size (if applicable)
        if isinstance(qend, int) and isinstance(qstart, int):
            size = qend - qstart
        else:
            size = None
        
        # Determine the type based on mapping type
        if mapping_type == "I":
            alignment_type = "insertion"
        elif mapping_type == "D":
            alignment_type = "deletion"
        elif mapping_type == "N":
            alignment_type = "inversion"
        else:
            alignment_type = "unknown"
        
        # Write the information to the BED file
        if size is not None:
            bed_file.write(f"{rname}\t{rstart}\t{rstart + size}\t{qname}\t{size}\t{alignment_type}\n")
        else:
            bed_file.write(f"{rname}\t{rstart}\t.\t{qname}\t.\t{alignment_type}\n")
