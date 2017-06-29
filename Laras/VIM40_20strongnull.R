library(party)

n=100

nullVIM40_20f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_20f<-matrix(0,nrow=n,ncol=100)
nullVIM40_20r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA40_20intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA40_20intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM40_20f[i,]<-varimp(RFf)
nullVIMAUC40_20f[i,]<-varimpAUC(RFf)
nullVIM40_20r[i,]<-varimp(RFr)
nullVIMAUC40_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM40_20f)<-col
colnames(nullVIMAUC40_20f)<-col
colnames(nullVIM40_20r)<-col
colnames(nullVIMAUC40_20r)<-col

write.table(nullVIM40_20f, "nullVIM40_20intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_20f, "nullVIMAUC40_20intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM40_20r, "nullVIM40_20intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_20r, "nullVIMAUC40_20intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
