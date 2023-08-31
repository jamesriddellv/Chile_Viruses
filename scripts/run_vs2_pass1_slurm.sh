#!/bin/bash
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH -n 20
#SBATCH --mem=89gb
#SBATCH --account=PAS1117
#SBATCH --job-name=vs2_pass1
#SBATCH --mail-user=riddell.26@buckeyemail.osu.edu
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --export=ALL
#SBATCH --output=slurm-%x_%A_%a.out
#SBATCH --array=1-161%10

bash ./run_vs2_pass1.sh ${SLURM_ARRAY_TASK_ID}
