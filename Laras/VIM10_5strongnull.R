library(party)

n=100

nullVIM10_5f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_5f<-matrix(0,nrow=n,ncol=100)
nullVIM10_5r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA10_5intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA10_5intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM10_5f[i,]<-varimp(RFf)
nullVIMAUC10_5f[i,]<-varimpAUC(RFf)
nullVIM10_5r[i,]<-varimp(RFr)
nullVIMAUC10_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM10_5f)<-col
colnames(nullVIMAUC10_5f)<-col
colnames(nullVIM10_5r)<-col
colnames(nullVIMAUC10_5r)<-col

write.table(nullVIM10_5f, "nullVIM10_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_5f, "nullVIMAUC10_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM10_5r, "nullVIM10_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_5r, "nullVIMAUC10_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
