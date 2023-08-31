arrayid=$(($1 + 1))
assembly=$(sed "${arrayid}q;d" ../assemblies.conf)

vs2Loc="/users/PAS1117/osu9664/eMicro-Apps/VirSorter2-2.2.3.sif"
dataDir="../data/all_fasta"
outDir="../processed-data/vs2-pass1/${assembly}"
minLength=5000
opts="--keep-original-seq --include-groups dsDNAphage,ssDNA --min-score 0.5 -j 20"

echo "unzipping fasta file to temporary directory..."
tar -xvzf $dataDir/${assembly}.fasta.tar.gz -C $TMPDIR
echo "file extract successfully, now running virsorter2..."

module load singularity
time $vs2Loc run \
-i $TMPDIR/${assembly}.fasta \
-w $outDir \
--min-length $minLength \
$opts all --rerun-incomplete
