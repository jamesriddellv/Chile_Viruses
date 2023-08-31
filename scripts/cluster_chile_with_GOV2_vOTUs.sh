#!/bin/bash
#SBATCH --time=10:00:00
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

# generate combined fasta:
cat ../processed-data/vOTU-clustering/chile-prefixed-vOTUs.fna /fs/ess/PAS1117/vs2sop-resource/ocean/vs2sop-votu.fna > ../processed-data/vOTU-clustering/chile_GOV2_combined_vOTUs.fna


CheckV-0.8.1-ClusterONLY.sif \
-i ../processed-data/vOTU-clustering/chile_GOV2_combined_vOTUs.fna \
-t 40 \
-o ../processed-data/vOTU-clustering/chile_GOV2_combined/ \
--min-ani 95 \
--min-qcov 0 \
--min-tcov 85
