arrayid=$(($1 + 1))
assembly=$(sed "${arrayid}q;d" ../assemblies.conf)

vs2Loc="/users/PAS1117/osu9664/eMicro-Apps/VirSorter2-2.2.3.sif"
outDir="/fs/ess/PAS1117/riddell26/Chile_Viruses/processed-data/vs2-pass2/${assembly}"
minLength=5000
opts="--seqname-suffix-off --viral-gene-enrich-off --provirus-off --prep-for-dramv -j 20 --include-groups dsDNAphage,ssDNA --min-score 0.5"

cat ../processed-data/checkv/${assembly}/viruses.fna ../processed-data/checkv/${assembly}/proviruses.fna > ../processed-data/checkv/${assembly}/combined.fna

module load singularity
time $vs2Loc run \
-i ../processed-data/checkv/${assembly}/combined.fna \
-w $outDir \
--min-length $minLength \
$opts all

wait
