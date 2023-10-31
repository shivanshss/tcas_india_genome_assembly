from Bio import Entrez
import pandas as pd
import warnings

Entrez.email = 'shivansh.bioscience@gmail.com'


# Read the single-column file
df = pd.read_csv('/home/bloodmark/workarea/20231011_maker/chr2_gene_codes.tab', header=None, names=["Accession"])

# Remove "Name=" from the entries
df['Accession'] = df['Accession'].str.replace('Name=', '')

# Extract the accession numbers
accession_list = df['Accession'].tolist()

# Create a dictionary to store gene names
gene_names = {}

# Loop through the accession list
for accession in accession_list:
    try:
        # Define a list of databases to query (you can add more if needed)
        databases = ["nucleotide", "protein"]

        # Initialize a variable to store the result
        gene_name = None

        # Loop through the databases
        for db in databases:
            try:
                handle = Entrez.esummary(db=db, id=accession)
                record = Entrez.read(handle)
                handle.close()

                if 'GeneName' in record[0]:
                    gene_name = record[0]['GeneName']
                    break  # Exit the loop once a gene name is found
            except Exception as e:
                warnings.warn(f"Warning: {str(e)}", UserWarning)

        if gene_name is not None:
            gene_names[accession] = gene_name
        else:
            gene_names[accession] = "NA"
    except Exception as e:
        print(f"Error: {str(e)}")

# Write the gene names to a text file
with open("chr2_gene_names.txt", "w") as file:
    for accession, gene_name in gene_names.items():
        file.write(f"{accession} : {gene_name}\n")

