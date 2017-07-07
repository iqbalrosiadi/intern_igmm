library(party)

dataf<-read.table(paste("input/finaldatainput.scrambled.1"), header=TRUE)
random_seed<-read.table(paste("input/random_seed"), header=FALSE)

n=dim(random_seed)[1] #500
#n=n-1
n=500
varimp<-matrix(0,nrow=n,ncol=54)
varimpAUC<-matrix(0,nrow=n,ncol=54)

for(i in 1:n){
	#set.seed(random_seed[i+1,])
	dataf<-read.table(paste("input/finaldatainput.scrambled.",i, sep=""), header=TRUE)
	control<-cforest_control(mtry=19,ntree=1000)

	RFf<-cforest(SCID_AgeOnset~.,data=dataf,controls=control)

	#varimp[i,]<-c(random_seed[i,],varimp(RFf))
	#varimpAUC[i,]<-c(random_seed[i,],varimpAUC(RFf))

	varimp[i,]<-varimp(RFf)
	varimpAUC[i,]<-varimpAUC(RFf)
}

colnames(varimp)<-c(names(dataf)[1],names(dataf)[3:55])
colnames(varimpAUC)<-c(names(dataf)[1],names(dataf)[3:55])
varimp<-varimp[,order(colnames(varimp))]
varimpAUC<-varimp[,order(colnames(varimpAUC))]
#colnames(random_seed)<-paste("rseed")
#varimp<-cbind(random_seed,varimp)
#varimpAUC<-cbind(random_seed,varimpAUC)

write.table(varimp, "output/scrambled/party.varVIM.scrambled.importance", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(varimpAUC, "output/scrambled/party.varVIMAUC.scrambled.importance", row.names=FALSE, col.names=TRUE,quote=FALSE)
