#!/bin/sh
#$ -N VIMmidnull
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM80_40midnull.R
#./simint10_20midnull.R
#./simint10_40midnull.R
#./simint40_5midnull.R
#./simint40_20midnull.R
#./simint40_40midnull.R
#./simint80_5midnull.R
#./simint80_20midnull.R
#./simint80_40midnull.R

