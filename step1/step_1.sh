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
    forward_read=$(echo "$line" | grep -oP 'path_to_sample_.*_forward_read:\s*\K.*')
    reverse_read=$(echo "$line" | grep -oP 'path_to_sample_.*_reverse_read:\s*\K.*')
    sample_output_dir="$path_to_create_output_files/$sample_name"

    # Create a directory for the current sample
    mkdir -p "$sample_output_dir"

    # Perform analysis steps
    echo "Processing $sample_name..."

    # Step 1: Run FastQC on raw reads
    fastqc "$forward_read" "$reverse_read" -o "$sample_output_dir/fastqc_raw"

    # Step 2: Run Trimmomatic
    java -jar trimmomatic PE -threads 4 "$forward_read" "$reverse_read" "$sample_output_dir/forward-paired.fq" "$sample_output_dir/forward-unpaired.fq" "$sample_output_dir/reverse-paired.fq" "$sample_output_dir/reverse-unpaired.fq" ILLUMINACLIP:/softwares/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:37 > "$sample_output_dir/trimmomatic.log"


    # Step 3: Run FastQC on trimmed reads
    fastqc "$sample_output_dir/forward-paired.fq" "$sample_output_dir/reverse-paired.fq" -o "$sample_output_dir/fastqc_trimmed"

    # Step 4: Run jellyfish/kmc and GenomeScope 
    jellyfish count -C "$sample_output_dir/trimmed_reads.fastq" -o "$sample_output_dir/kmer_count.jf" -m 33 -t 64
    Rscript genomescope.R "$sample_output_dir/kmer_count.jf" "$sample_output_dir/genomescope_results" -k 33

    echo "Done processing $sample_name."
done < "$config_file"

echo "Analysis complete!"

