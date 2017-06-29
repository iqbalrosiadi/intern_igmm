#!/bin/sh
#$ -N VIMstrong
#$ -cwd
#$ -l h_rt=12:00:00
#$ -l h_vmem=1G
#$ -pe sharedmem 8 
# Make the job resubmit itself if it runs out of time: rsync will start where it left off
#$ -r yes
#$ -notify
trap 'exit 99' sigusr1 sigusr2 sigterm

# $ -t 1:9

. /etc/profile.d/modules.sh

module load R/3.2.2

# Run the program

Rscript ./VIM10_20strong.R
#./simint10_20strong.R
#./simint10_40strong.R
#./simint40_5strong.R
#./simint40_20strong.R
#./simint40_40strong.R
#./simint80_5strong.R
#./simint80_20strong.R
#./simint80_40strong.R

