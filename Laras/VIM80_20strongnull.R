library(party)

n=100

nullVIM80_20f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_20f<-matrix(0,nrow=n,ncol=100)
nullVIM80_20r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA80_20intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA80_20intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM80_20f[i,]<-varimp(RFf)
nullVIMAUC80_20f[i,]<-varimpAUC(RFf)
nullVIM80_20r[i,]<-varimp(RFr)
nullVIMAUC80_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM80_20f)<-col
colnames(nullVIMAUC80_20f)<-col
colnames(nullVIM80_20r)<-col
colnames(nullVIMAUC80_20r)<-col

write.table(nullVIM80_20f, "nullVIM80_20intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_20f, "nullVIMAUC80_20intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM80_20r, "nullVIM80_20intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_20r, "nullVIMAUC80_20intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
