#!/bin/bash
#PBS -lnodes=1:cores16:ppn=16
#PBS -lwalltime=48:00:00

cd /home/dongtong/iqbal/workingset_lisa

module load R
module load randomjungle
Rscript ./process_rjungle.R
