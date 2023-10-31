
mkdir /home/dagashe/shivanshss/discover_y/01B

mkdir /home/dagashe/shivanshss/discover_y/01N

mkdir /home/dagashe/shivanshss/discover_y/12B

#mkdir /home/dagashe/shivanshss/discover_y/12E

#mkdir /home/dagashe/shivanshss/discover_y/13C

#mkdir /home/dagashe/shivanshss/discover_y/13E

#mkdir /home/dagashe/shivanshss/discover_y/18A

#mkdir /home/dagashe/shivanshss/discover_y/18B




cp /home/dagashe/shivanshss/discover_y/contigs/contigs_01B.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_01B/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads

/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/01B/01B_proportion_annotated.fasta




cp /home/dagashe/shivanshss/discover_y/contigs/contigs_01N.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_01N/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male


cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/01N/01N_proportion_annotated.fasta





cp /home/dagashe/shivanshss/discover_y/contigs/contigs_12B.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_12B/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/12B/12B_proportion_annotated.fasta






cp /home/dagashe/shivanshss/discover_y/contigs/contigs_12E.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_12E/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/12E/12E_proportion_annotated.fasta







cp /home/dagashe/shivanshss/discover_y/contigs/contigs_13C.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_13C/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/13C/13C_proportion_annotated.fasta






cp /home/dagashe/shivanshss/discover_y/contigs/contigs_13E.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_13E/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/13E/13E_proportion_annotated.fasta






cp /home/dagashe/shivanshss/discover_y/contigs/contigs_18A.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_18A/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/18A/18A_proportion_annotated.fasta





cp /home/dagashe/shivanshss/discover_y/contigs/contigs_18B.fasta /home/dagashe/shivanshss/tools/DiscoverY/data/male_contigs.fasta

cp /home/dagashe/shivanshss/discover_y/dsk_kmers/dsk_output_18B/dsk_output/kmers_from_reads /home/dagashe/shivanshss/tools/DiscoverY/data/kmers_from_male_reads


/softwares/python383/bin/python3 /home/dagashe/shivanshss/tools/DiscoverY/discoverY.py --kmer_size 33 --female_bloom_capacity 1896087208 --mode female+male

cp /home/dagashe/shivanshss/tools/DiscoverY/proportion_annotated_contigs.fasta /home/dagashe/shivanshss/discover_y/18B/18B_proportion_annotated.fasta
