#!/bin/bash -l
#SBATCH -D /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab
#SBATCH -o /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stdout-%A_%a.txt
#SBATCH -e /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stderr-%A_%a.txt
#SBATCH -J mapping
#SBATCH -t 2:00:00
#SBATCH --array=1-20  # Define an array job from 1 to 20
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4  # Adjust based on available resources

set -e
set -u

# Load required modules
module load bwa samtools bcftools

# Change to the working directory
cd largedata/sorghum

# Define sample ID from the SLURM array index
SAMPLE_ID=$SLURM_ARRAY_TASK_ID

# Run BWA alignment for the corresponding sample
bwa mem chr1.fasta l${SAMPLE_ID}.read1.fq l${SAMPLE_ID}.read2.fq | samtools view -bSh - > l${SAMPLE_ID}.bam

# Sort the BAM file
samtools sort l${SAMPLE_ID}.bam -o sorted_l${SAMPLE_ID}.bam

# Index the sorted BAM file
samtools index sorted_l${SAMPLE_ID}.bam

