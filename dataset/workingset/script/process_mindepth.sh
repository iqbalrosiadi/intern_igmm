#!/bin/sh
#$ -N VIMmindepth
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 16 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R

# Run the program

Rscript ./process_mindepth.R
#./simint10_20strong.R
#./simint10_40strong.R
#./simint40_5strong.R
#./simint40_20strong.R
#./simint40_40strong.R
#./simint80_5strong.R
#./simint80_20strong.R
#./simint80_40strong.R


