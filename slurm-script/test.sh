#!/bin/bash -l
#SBATCH -D /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab
#SBATCH -o /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/slurm-log/testout-%j.txt
#SBATCH -e /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/error-%j.txt
#SBATCH -J sim20
set -e
set -u

cd /mnt/nrdstor/jyanglab/jyang21/2025-agro932-lab/largedata
for i in {1..20}
do
   wgsim first_chr.fa -e 0 -d 500 -N 50000 -1 100 -2 100 -r 0.1  -R 0 -X 0 l$i.read1.fq l$i.read2.fq
done
