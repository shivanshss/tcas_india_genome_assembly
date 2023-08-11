#!/bin/bash

# Read config file
if [ $# -ne 1 ]; then
    echo "Usage: $0 <config_file>"
    exit 1
fi

config_file="$1"
if [ ! -f "$config_file" ]; then
    echo "Config file not found: $config_file"
    exit 1
fi

source "$config_file"

# Create output directory if it doesn't exist
mkdir -p "$path_to_create_output_files"

# Loop through each sample in the config file
while IFS= read -r line; do
    if [ -z "$line" ]; then
        continue
    fi

    # Parse sample information
    sample_name=$(echo "$line" | grep -oP 'sample_name:\s*\K.*')
    forward_read=$(echo "$line" | grep -oP 'path_to_sample.*_forward_read:\s*\K.*')
    reverse_read=$(echo "$line" | grep -oP 'path_to_sample.*_reverse_read:\s*\K.*')
    sample_output_dir="$path_to_create_output_files/$sample_name"

    # Create a directory for the current sample
    mkdir -p "$sample_output_dir"

    # Perform analysis steps
    echo "Processing $sample_name..."

    # Step 1: Run hybridSPAdes 
    python3 spades.py -o "$sample_output_dir/hybridSPAdes_output" -1 "$forward_read" -2 "$reverse_read" -l "$path_to_nanopore_reads"

    # Step 2: Run RagTag (Replace with actual command)
    python3 ragtag.py scaffold "$sample_output_dir/hybridSPAdes_output/contigs.fasta" "$path_to_reference_genome" -o "$sample_output_dir/ragtag_output"

    echo "Done processing $sample_name."
done < "$config_file"

echo "Analysis complete!"

