arrayid=$(($1 + 1))
assembly=$(sed "${arrayid}q;d" ../assemblies.conf)

module use /fs/project/PAS1117/modulefiles
module load DRAM

# Annotate
fasta_input="../processed-data/vs2-pass2/${assembly}/for-dramv/final-viral-combined-for-dramv.fa"
affi_input="../processed-data/vs2-pass2/${assembly}/for-dramv/viral-affi-contigs-for-dramv.tab"

# Variables to pass to DRAMv annotate
opts="--skip_trnascan --threads 20 --min_contig_size 1000"
outDir="../processed-data/DRAMv/${assembly}/DRAMv-annotate"

time DRAM-v.py annotate -i $fasta_input -v $affi_input -o $outDir $opts

# Then summarize
time DRAM-v.py distill -i $outDir/annotations.tsv -o "../processed-data/DRAMv/${assembly}/DRAMv-distill"
