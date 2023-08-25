#!/bin/bash

# Constants
README_CONTENT="### Few pointers for Project Organization\n- Use GitHub for collaborating, sharing, and version control of your scripts!\n- Add your raw data, backup data, and any large files >50 Mb to .gitignore file.\n- Use a pipeline management tool such as snakemake or nextflow\n- Document each step of the genome assembly and annotation process.\n- Store intermediate files for reproducibility."

# Function to create directory with validation
create_directory() {
    if [ ! -d "$1" ]; then
        mkdir "$1"
        echo "Created directory: $1"
    else
        echo "Directory '$1' already exists. Skipping..."
    fi
}

# User input for project name
read -p "Enter the name of your project (avoid spaces, use underscores): " project_name

# Create project directory
create_directory "$project_name"

# Create subdirectories
create_directory "$project_name/data"
create_directory "$project_name/data/short_reads"
create_directory "$project_name/data/long_reads"

create_directory "$project_name/assembly"
create_directory "$project_name/assembly/spades"
create_directory "$project_name/assembly/rescaffolding"
create_directory "$project_name/assembly/purging"
create_directory "$project_name/assembly/polishing"

create_directory "$project_name/annotation"
create_directory "$project_name/annotation/computational"
create_directory "$project_name/annotation/denovo_gene_finding"

create_directory "$project_name/docs"
create_directory "$project_name/docs/protocols"
create_directory "$project_name/docs/analysis_notes"

create_directory "$project_name/scripts"
create_directory "$project_name/scripts/assembly_scripts"
create_directory "$project_name/scripts/annotation_scripts"

create_directory "$project_name/results"
create_directory "$project_name/results/assembly_results"
create_directory "$project_name/results/annotation_results"

create_directory "$project_name/tmp"
create_directory "$project_name/tmp/assembly_tmp"
create_directory "$project_name/tmp/annotation_tmp"

# Create readme files
echo "$README_CONTENT" > "$project_name/README.md"
echo "This directory is for raw short reads." > "$project_name/data/short_reads/readme.md"
echo "This directory is for raw long reads." > "$project_name/data/long_reads/readme.md"

echo "This directory contains assembly results using SPAdes." > "$project_name/assembly/spades/readme.md"
echo "This directory contains results from rescaffolding tools." > "$project_name/assembly/rescaffolding/readme.md"
echo "This directory contains results after purging haplotigs." > "$project_name/assembly/purging/readme.md"
echo "This directory contains polished genome assembly results." > "$project_name/assembly/polishing/readme.md"

echo "This directory contains computational annotation results." > "$project_name/annotation/computational/readme.md"
echo "This directory contains de novo gene finding annotation results." > "$project_name/annotation/denovo_gene_finding/readme.md"

echo "This directory contains protocols for various steps." > "$project_name/docs/protocols/readme.md"
echo "This directory contains analysis notes for each step." > "$project_name/docs/analysis_notes/readme.md"

echo "This directory contains scripts for genome assembly." > "$project_name/scripts/assembly_scripts/readme.md"
echo "This directory contains scripts for genome annotation." > "$project_name/scripts/annotation_scripts/readme.md"

echo "This directory contains assembly results for each step." > "$project_name/results/assembly_results/readme.md"
echo "This directory contains annotation results for each step." > "$project_name/results/annotation_results/readme.md"

# Success message
echo "Project Initialization completed successfully!"
tree "$project_name"
