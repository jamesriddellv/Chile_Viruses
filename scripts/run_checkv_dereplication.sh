#!/bin/bash
#SBATCH --time=06:00:00
#SBATCH --nodes=1
#SBATCH --mem=117gb
#SBATCH --account=PAS1117
#SBATCH --job-name=checkv_derep
#SBATCH --mail-user=riddell.26@buckeyemail.osu.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --export=ALL
#SBATCH --output=%x_%j.out

module use /fs/project/PAS1117/modulefiles
module load singularityImages
CheckV-0.8.1-ClusterONLY.sif \
-i ../scaffolds_1kb/STM_0716_E_M_COMBINED_megahit_final.contigs_1000.fasta \
-t 28 \
-o ../scaffolds_1kb/dereplicated \
--min-ani 98 \
--min-qcov 0 \
--min-tcov 85
