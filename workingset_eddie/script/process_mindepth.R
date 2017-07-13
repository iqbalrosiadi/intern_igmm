library(randomForestSRC)

mindep_dataf<-read.table(paste("input/finaldatainput"), header=TRUE)
random_seed<-read.table(paste("input/random_seed"), header=FALSE)

x=dim(random_seed)[1] #500
x=x-1
#x=1
min_depth19<-matrix(0,nrow=x,ncol=53)
vim19<-matrix(0,nrow=x,ncol=53)
colnamelist<-names(mindep_dataf)[2:54]

for(l in 1:x){
	set.seed(random_seed[l+1,])
	#set.seed(random_seed[1,])
	bf<-var.select(SCID_AgeOnset~.,mindep_dataf,ntree=1000,mtry=19)
	df<-bf$varselect

	mindepval19<-c()
	vimval19<-c()
	for(j in 1:53){
		p1f=rownames(df)==colnamelist[j]
		mindepval19<-append(mindepval19,df[p1f,1],after=length(mindepval19))
		vimval19<-append(vimval19,df[p1f,2],after=length(vimval19))
	}

	#min_depth19[l,]<-c(random_seed[l,],mindepval19)
	#vim19[l,]<-c(random_seed[l,],vimval19)
	min_depth19[l,]<-mindepval19
	vim19[l,]<-vimval19

}

#colnames(min_depth19)<-c(print("rseeds"),colnamelist)
#colnames(vim19)<-c(print("rseeds"),colnamelist)

colnames(min_depth19)<-colnamelist
colnames(vim19)<-colnamelist
min_depth19<-min_depth19[,order(colnames(min_depth19))]
vim19<-vim19[,order(colnames(vim19))]


write.table(min_depth19, "output/RFSC.mindepth_RF19.mindep", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(vim19, "output/RFSC.VIM_RF19.importance", row.names=FALSE, col.names=TRUE,quote=FALSE)
