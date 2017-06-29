library(party)

n=100

nullVIM10_20f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_20f<-matrix(0,nrow=n,ncol=100)
nullVIM10_20r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA10_20intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA10_20intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM10_20f[i,]<-varimp(RFf)
nullVIMAUC10_20f[i,]<-varimpAUC(RFf)
nullVIM10_20r[i,]<-varimp(RFr)
nullVIMAUC10_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM10_20f)<-col
colnames(nullVIMAUC10_20f)<-col
colnames(nullVIM10_20r)<-col
colnames(nullVIMAUC10_20r)<-col

write.table(nullVIM10_20f, "nullVIM10_20intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_20f, "nullVIMAUC10_20intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM10_20r, "nullVIM10_20intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_20r, "nullVIMAUC10_20intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
