#!/bin/bash
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH -n 10
#SBATCH --account=PAS1117
#SBATCH --job-name=VS2-SOP-screen
#SBATCH --mail-user=riddell.26@buckeyemail.osu.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --export=ALL
#SBATCH --output=%x_%A_%a.out
#SBATCH --array=1-161

arrayid=$((${SLURM_ARRAY_TASK_ID} + 1))

assembly=$(sed "${arrayid}q;d" ../assemblies.conf)

workDir="/fs/ess/PAS1117/riddell26/Chile_Viruses"

vs2_genomes="${workDir}/processed-data/vs2-pass2/${assembly}/for-dramv/final-viral-combined-for-dramv.fa"
vs2_final_score="${workDir}/processed-data/vs2-pass2/${assembly}/final-viral-score.tsv"
amg_summary="${workDir}/processed-data/DRAMv/${assembly}/DRAMv-distill/amg_summary.tsv"
checkv_contamination="${workDir}/processed-data/checkv/${assembly}/contamination.tsv"

output_dir="${workDir}/processed-data/VS2-SOP-screen/${assembly}"

python /users/PAS1117/osu9664/eMicro-Apps/Process-VS2_and_DRAMv.py --vs2-scores $vs2_final_score \
--checkv-contam $checkv_contamination --dramv-amg $amg_summary --vs2-genomes $vs2_genomes \
--output-dir $output_dir --drop-manual
