library(party)

n=500

nullVIM40_40f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_40f<-matrix(0,nrow=n,ncol=100)
nullVIM40_40r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC40_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA40_40intweakfull033.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA40_40intweakred05.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM40_40f[i,]<-varimp(RFf)
nullVIMAUC40_40f[i,]<-varimpAUC(RFf)
nullVIM40_40r[i,]<-varimp(RFr)
nullVIMAUC40_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM40_40f)<-col
colnames(nullVIMAUC40_40f)<-col
colnames(nullVIM40_40r)<-col
colnames(nullVIMAUC40_40r)<-col

write.table(nullVIM40_40f, "nullVIM40_40intweakfull033", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_40f, "nullVIMAUC40_40intweakfull033", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM40_40r, "nullVIM40_40intweakred05", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC40_40r, "nullVIMAUC40_40intweakred05", row.names=FALSE, col.names=TRUE,quote=FALSE)
