library(party)

n=100

nullVIM80_5f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_5f<-matrix(0,nrow=n,ncol=100)
nullVIM80_5r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA80_5intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA80_5intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM80_5f[i,]<-varimp(RFf)
nullVIMAUC80_5f[i,]<-varimpAUC(RFf)
nullVIM80_5r[i,]<-varimp(RFr)
nullVIMAUC80_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM80_5f)<-col
colnames(nullVIMAUC80_5f)<-col
colnames(nullVIM80_5r)<-col
colnames(nullVIMAUC80_5r)<-col

write.table(nullVIM80_5f, "nullVIM80_5intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_5f, "nullVIMAUC80_5intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM80_5r, "nullVIM80_5intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_5r, "nullVIMAUC80_5intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
