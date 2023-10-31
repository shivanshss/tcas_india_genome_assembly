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
    sample_name=$(echo "$line" | grep -oP 'sample\d+:\s*\K.*')
    sample_output_dir="$path_to_create_output_files/$sample_name"

    # Create a directory for the current sample
    mkdir -p "$sample_output_dir"

    # Perform analysis steps
    echo "Processing $sample_name..."

    cd $sample_output_dir
    
    # Step 1: Run Purge Haplotigs (Replace with actual command)
    purge_haplotigs hist -b $sample1_bam -g $sample1 -t 64
    
    purge_haplotigs cov -i "$sample_output_dir/.gencov" -l 10 -m 50 -h 150 -o da01a_coverage_stats.csv -j 80 -s 80
    
    purge_haplotigs -l 5 -m 30 -h 190 -a 40 -o "$sample_output_dir/purged_assembly.fasta"

    # Step 2: Run QUAST
    quast.py -o "$sample_output_dir/quast_output" "$sample_output_dir/purged_assembly.fasta" -r reference_genome -g reference_gff --gene-finding --eukaryote --large --split-scaffolds --fragmented --extensive-mis-size 10000 --skip-unaligned-mis-contigs --k-mer-stats --conserved-genes-finding --threads 16

    # Step 3: Run GAEP (not_final)
    #gaep -i "$sample_output_dir/purged_assembly.fasta" -o "$sample_output_dir/gaep_output.txt"

    # Step 4: Run BUSCO
    busco -i "$sample_output_dir/purged_assembly.fasta" -o "$sample_output_dir/busco_output" -l "$path_to_busco_db"  -m genome --augustus --offline --config busco_config -f 

    # Step 5: Perform Pilon error polishing
    java -Xmx64G -jar pilon --genome "$sample_output_dir/purged_assembly.fasta" --frags "$sample1" --outdir "$sample_output_dir/pilon_round1" --vcf --tracks --diploid --K 15

    # Step 6: Run Purge Haplotigs again (Replace with actual command)
    purge_haplotigs -l 10 -m 50 -h 150 -a 80 -o "$sample_output_dir/final_purged_assembly.fasta"

    echo "Done processing $sample_name."
done < "$config_file"

echo "Analysis complete!"

