export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/bin/":$PATH

export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/scripts/":$PATH

export PATH="/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/config/":$PATH

export AUGUSTUS_CONFIG_PATH=/home/dagashe/shivanshss/tools/augustus_old/augustus-3.3.3/config

/home/dagashe/shivanshss/tools/busco/bin/busco -i /home/dagashe/shivanshss/new_genomes/tcas6_final_all.fasta -l insecta_odb10 -o busco_tcas6_final -m genome --augustus --offline --config /home/dagashe/shivanshss/tools/busco/config/config_tcas6


