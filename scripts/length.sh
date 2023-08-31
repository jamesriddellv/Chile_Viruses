#!/bin/bash
#SBATCH -t 1:00:00
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -A PAS1117
#SBATCH -J length

cd /fs/ess/PAS1117/riddell26/Chile_Viruses

perl /fs/project/PAS1117/Global_AMGs/scripts/lengthcont.pl \
processed-data/vOTU-clustering/combined-final-viral-scored.fa.self-blastn.clusters.fna  \
> processed-data/vOTU-clustering/chile-vOTUs.length

perl /fs/project/PAS1117/Global_AMGs/scripts/lengthcont.pl \
processed-data/vOTU-clustering/combined-final-viral-scored.fa \
> processed-data/vOTU-clustering/combined-final-viral-scored.length
