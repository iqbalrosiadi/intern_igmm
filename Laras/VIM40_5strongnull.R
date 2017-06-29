library(party)

n=100

nullVIM40_5f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_5f<-matrix(0,nrow=n,ncol=100)
nullVIM40_5r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA40_5intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA40_5intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM40_5f[i,]<-varimp(RFf)
nullVIMAUC40_5f[i,]<-varimpAUC(RFf)
nullVIM40_5r[i,]<-varimp(RFr)
nullVIMAUC40_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM40_5f)<-col
colnames(nullVIMAUC40_5f)<-col
colnames(nullVIM40_5r)<-col
colnames(nullVIMAUC40_5r)<-col

write.table(nullVIM40_5f, "nullVIM40_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_5f, "nullVIMAUC40_5intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM40_5r, "nullVIM40_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_5r, "nullVIMAUC40_5intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
