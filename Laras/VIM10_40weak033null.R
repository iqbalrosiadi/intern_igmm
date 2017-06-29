library(party)

n=500

nullVIM10_40f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_40f<-matrix(0,nrow=n,ncol=100)
nullVIM10_40r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC10_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA10_40intweakfull033.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA10_40intweakred05.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM10_40f[i,]<-varimp(RFf)
nullVIMAUC10_40f[i,]<-varimpAUC(RFf)
nullVIM10_40r[i,]<-varimp(RFr)
nullVIMAUC10_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM10_40f)<-col
colnames(nullVIMAUC10_40f)<-col
colnames(nullVIM10_40r)<-col
colnames(nullVIMAUC10_40r)<-col

write.table(nullVIM10_40f, "nullVIM10_40intweakfull033", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_40f, "nullVIMAUC10_40intweakfull033", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM10_40r, "nullVIM10_40intweakred05", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC10_40r, "nullVIMAUC10_40intweakred05", row.names=FALSE, col.names=TRUE,quote=FALSE)
