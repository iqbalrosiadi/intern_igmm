#!/bin/sh
#$ -N VIMfullread
#$ -cwd
#$ -l h_rt=72:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM10_20nullerror.R
#./VIM10_20fullread.R
#./VIM10_40fullread.R
#./VIM40_5fullread.R
#./VIM40_20fullread.R
#./VIM40_40fullread.R
#./VIM80_5fullread.R
#./VIM80_20fullread.R
#./VIM80_40fullread.R

