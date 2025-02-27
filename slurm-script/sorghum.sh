#!/bin/bash -l
#SBATCH -D /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab
#SBATCH -o /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stdout-%j.txt
#SBATCH -e /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/stderr-%j.txt
#SBATCH -J mapping
#SBATCH -t 2:00:00
set -e
set -u

# insert your script here
module load bwa samtools bcftools

# change your dir on HCC
cd largedata/sorghum


# alignment
for i in {1..20}; do bwa mem chr1.fasta l$i.read1.fq l$i.read2.fq | samtools view -bSh - > l$i.bam; done
# sort
for i in *.bam; do samtools sort $i -o sorted_$i; done
# index them
for i in sorted*.bam; do samtools index $i; done

