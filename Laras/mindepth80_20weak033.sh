#!/bin/sh
#$ -N mindepthfullread
#$ -cwd
#$ -l h_rt=72:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./mindepth80_20weak033.R
#./mindepth10_20fullread.R
#./mindepth10_40fullread.R
#./mindepth40_5fullread.R
#./mindepth40_20fullread.R
#./mindepth40_40fullread.R
#./mindepth80_5fullread.R
#./mindepth80_20fullread.R
#./mindepth80_40fullread.R

