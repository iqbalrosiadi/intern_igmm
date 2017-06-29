#!/bin/sh
#$ -N VIMstrong
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM40_20strong.R
#./simint10_20strong.R
#./simint10_40strong.R
#./simint40_5strong.R
#./simint40_20strong.R
#./simint40_40strong.R
#./simint80_5strong.R
#./simint80_20strong.R
#./simint80_40strong.R

