arrayid=$(($1 + 1))
assembly=$(sed "${arrayid}q;d" ../assemblies.conf)

checkvLoc="/users/PAS1117/osu9664/eMicro-Apps/CheckV-0.8.1.sif"
outDir="../processed-data/checkv/${assembly}"
inFile="../processed-data/vs2-pass1/${assembly}/final-viral-combined.fa"

module load singularity
time $checkvLoc end_to_end $inFile $outDir -t 40
