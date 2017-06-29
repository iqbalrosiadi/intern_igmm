#!/bin/sh
#$ -N VIMstrongnull
#$ -cwd
#$ -l h_rt=08:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM40_20strongnull.R
#./simint10_20strongnull.R
#./simint10_40strongnull.R
#./simint40_5strongnull.R
#./simint40_20strongnull.R
#./simint40_40strongnull.R
#./simint80_5strongnull.R
#./simint80_20strongnull.R
#./simint80_40strongnull.R

