#!/bin/sh
#$ -N VIMmid
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM80_40mid.R
#./simint10_20mid.R
#./simint10_40mid.R
#./simint40_5mid.R
#./simint40_20mid.R
#./simint40_40mid.R
#./simint80_5mid.R
#./simint80_20mid.R
#./simint80_40mid.R

