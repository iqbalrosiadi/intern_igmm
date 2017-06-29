#!/bin/sh
#$ -N nullmindepthweak033
#$ -cwd
#$ -l h_rt=72:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./nullmindepth80_5weak033.R
#./simint10_20weak033.R
#./simint10_40weak033.R
#./simint40_5weak033.R
#./simint40_20weak033.R
#./simint40_40weak033.R
#./simint80_5weak033.R
#./simint80_20weak033.R
#./simint80_40weak033.R

