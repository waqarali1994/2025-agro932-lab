#!/bin/bash -l
#SBATCH -D /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab
#SBATCH -o /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stdout-%A_%a.txt
#SBATCH -e /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stderr-%A_%a.txt
#SBATCH -J SNP_calling
#SBATCH -t 4:00:00
#SBATCH --array=1-20  # Define an array job from 1 to 20
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4  # Adjust based on available resources

set -e
set -u

# Load required modules
module load samtools bcftools

# Change to the working directory
cd largedata/sorghum

# Define sample ID from the SLURM array index
SAMPLE_ID=$SLURM_ARRAY_TASK_ID

# Step 1: Index the sorted BAM file (if not already indexed)
if [ ! -f sorted_l${SAMPLE_ID}.bam.bai ]; then
    samtools index sorted_l${SAMPLE_ID}.bam
fi

# Step 2: Generate mpileup file
bcftools mpileup -f chr1.fasta sorted_l${SAMPLE_ID}.bam > l${SAMPLE_ID}.mpileup

# Step 3: Call SNPs with conserved calling and output everything
bcftools call -c -Ob -o l${SAMPLE_ID}.bcf l${SAMPLE_ID}.mpileup

# Step 4: Index the VCF file
bcftools index l${SAMPLE_ID}.bcf

