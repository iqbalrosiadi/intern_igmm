library(party)

n=100

VIM10_5f<-matrix(0,nrow=n,ncol=100)
VIMAUC10_5f<-matrix(0,nrow=n,ncol=100)
VIM10_5r<-matrix(0,nrow=n,ncol=100)
VIMAUC10_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA10_5intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA10_5intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM10_5f[i,]<-varimp(RFf)
VIMAUC10_5f[i,]<-varimpAUC(RFf)
VIM10_5r[i,]<-varimp(RFr)
VIMAUC10_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM10_5f)<-col
colnames(VIMAUC10_5f)<-col
colnames(VIM10_5r)<-col
colnames(VIMAUC10_5r)<-col

write.table(VIM10_5f, "VIM10_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_5f, "VIMAUC10_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM10_5r, "VIM10_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_5r, "VIMAUC10_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
