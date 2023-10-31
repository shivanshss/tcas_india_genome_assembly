import csv
from Bio import Entrez
from Bio import SeqIO
import time

# Set your email for the Entrez service
Entrez.email = "shivansh.bioscience@gmail.com"

# Function to determine the database for a given accession number
def determine_database(accession):
    if accession.startswith("XP_") or accession.startswith("NP_"):
        return "protein"
    else:
        return "nucleotide"

# Function to extract gene name from the description
def extract_gene_name(description):
    # Split the description by square brackets and take the first part
    parts = description.split('[')
    if len(parts) > 1:
        gene_name = parts[0]
    else:
        gene_name = description  # Use the whole description if square brackets are not present
    return gene_name.strip()  # Remove leading/trailing whitespace

# Function to fetch gene names with retries for a batch of accession numbers
def fetch_gene_names_for_batch(accession_batch, max_retries=3):
    gene_names = []
    for accession in accession_batch:
        database = determine_database(accession)
        retries = 0
        while retries < max_retries:
            try:
                handle = Entrez.efetch(db=database, id=accession, rettype="gb", retmode="text")
                record = SeqIO.read(handle, "genbank")
                description = record.description
                gene_name = extract_gene_name(description)
                gene_names.append((accession, gene_name))
                break  # Successful, break out of the retry loop
            except Exception as e:
                retries += 1
                if retries < max_retries:
                    time.sleep(1)  # Wait for a moment before retrying
                else:
                    gene_names.append((accession, 'Error: ' + str(e)))
    return gene_names

# Read the input CSV file
input_file = '/home/bloodmark/workarea/20231011_maker/chr2_non_gi_accessions.txt'
output_file = '/home/bloodmark/workarea/20231011_maker/chr2_non_gi_gene_names.txt'

# Batch size (fetch 20 accession numbers at a time)
batch_size = 20

with open(input_file, 'r') as csvfile:
    reader = csv.reader(csvfile)
    header = next(reader)  # Read the header row
    accession_numbers = [row[0] for row in reader if row]

# Fetch gene names in batches
gene_names = []
for i in range(0, len(accession_numbers), batch_size):
    accession_batch = accession_numbers[i:i + batch_size]
    batch_gene_names = fetch_gene_names_for_batch(accession_batch)
    gene_names.extend(batch_gene_names)

# Write results to an output CSV file
with open(output_file, 'w', newline='') as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(['Accession Number', 'Gene Name'])
    for accession, gene_name in gene_names:
        writer.writerow([accession, gene_name])

print(f"Gene names for {len(accession_numbers)} accession numbers have been fetched and saved to {output_file}.")

