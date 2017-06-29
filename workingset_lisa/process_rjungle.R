library(MASS)
## File handling for Random Jungle
rjungleExe <- file.path("rjungle")
rjungleInFile <- file.path("input/finaldatainput")
rjungleOutFile <- file.path("output/rjungle")
random_seed<-read.table(paste("input/random_seed"), header=FALSE)

system("module load randomjungle")
n=dim(random_seed)[1] #500
#n=2
for(i in 1:n){
		## Run Random Jungle
		rjunglePermCMD <- paste(rjungleExe,"-f", rjungleInFile, "-v", ## show processing
			"-i2", ## chose permutation-Importance
			"-m 19",
			"-t 1000", ## 1000 trees
			"-D SCID_AgeOnset", ## response variable name
			"-z",
			random_seed[i,],
			"-o", 
			paste(rjungleOutFile,".",i, sep="")
			) ## out file path

		try(system(rjunglePermCMD))	
}
