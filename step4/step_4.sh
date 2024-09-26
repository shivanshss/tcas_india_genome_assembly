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
    sample_name=$(echo "$line" | grep -oP 'sample\d+name:\s*\K.*')
    sample_read1=$(echo "$line" | grep -oP 'read1:\s*\K.*')
    sample_read2=$(echo "$line" | grep -oP 'read2:\s*\K.*')
    sample_output_dir="$path_to_create_output_files/$sample_name"

    # Create a directory for the current sample
    mkdir -p "$sample_output_dir"

    # Perform analysis steps
    echo "Processing $sample_name..."

    # Step 1: Run RepeatModeller 
    repeatmodeller -database "$path_to_protein_db" -input "$sample_output_dir/repeats.fasta"

    # Step 2: Run Blastx 
    blastx -query "$sample_output_dir/repeats.fasta" -db "$path_to_arthropoda_db" -out "$sample_output_dir/blastx_result.xml" -evalue 1e-3

    # Step 3: Run RepeatMasker 
    repeatmasker -e ncbi -s -lib "$sample_output_dir/repeats.fasta" "$sample_output_dir/genome.fasta"

    # Step 4: Run SOAPdenovo-Trans 
    soapdenovo-trans -s "$sample_output_dir/soapdenovo_config.txt" -o "$sample_output_dir/soapdenovo_output" -K "$kmer_value"

    # Step 5: Run AUGUSTUS and Exonerate 
    augustus --genome="$sample_output_dir/genome.fasta" --species=arthropoda --outfile="$sample_output_dir/augustus_output.gff"
    exonerate --query "$sample_output_dir/augustus_output.gff" --target "$sample_output_dir/genome.fasta" --output "$sample_output_dir/exonerate_output.gff"

    # Step 6: Run SNAP 
    snap "$sample_output_dir/genome.fasta" "$sample_output_dir/snap_output.gff"

    # Step 7: Run GlimmerHMM 
    glimmerhmm "$sample_output_dir/genome.fasta" > "$sample_output_dir/glimmerhmm_output.gff"

    # Step 8: Run Twinscan/N-SCAN 
    twinscan -genome="$sample_output_dir/genome.fasta" -train="$sample_output_dir/augustus_output.gff" -trans="$sample_output_dir/snap_output.gff" -out="$sample_output_dir/twinscan_output.gff"

    echo "Done processing $sample_name."
done < "$config_file"

echo "Analysis complete!"

