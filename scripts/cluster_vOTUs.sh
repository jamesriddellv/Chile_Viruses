#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --mem=177gb
#SBATCH --account=PAS1117
#SBATCH --job-name=checkv_derep
#SBATCH --mail-user=riddell.26@buckeyemail.osu.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --export=ALL
#SBATCH --output=slurm-%x_%j.out

module use /fs/project/PAS1117/modulefiles
module load singularityImages
module load blast/2.13.0+
CheckV-0.8.1-ClusterONLY.sif \
-i ../processed-data/vOTU-clustering/combined-final-viral-scored.fa \
-t 40 \
-o ../processed-data/vOTU-clustering/ \
--min-ani 95 \
--min-qcov 0 \
--min-tcov 85

# post-processing to rename
# (base) [riddell26@pitzer-login01 vOTU-clustering]$ mv combined-final-viral-scored.fa.self-blastn.clusters.fna chile-vOTUs.fna
# (base) [riddell26@pitzer-login01 vOTU-clustering]$ mv combined-final-viral-scored.fa.self-blastn.clusters.tsv chile-vOTUs-blastn-clusters.tsv
# (base) [riddell26@pitzer-login01 vOTU-clustering]$ mv combined-final-viral-scored.fa.self-blastn.tsv combined-final-viral-scored-self-blastn.tsv
