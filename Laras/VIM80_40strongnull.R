library(party)

n=100

nullVIM80_40f<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_40f<-matrix(0,nrow=n,ncol=100)
nullVIM80_40r<-matrix(0,nrow=n,ncol=100)
nullVIMAUC80_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("nullDATA80_40intstrongfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("nullDATA80_40intstrongrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

nullVIM80_40f[i,]<-varimp(RFf)
nullVIMAUC80_40f[i,]<-varimpAUC(RFf)
nullVIM80_40r[i,]<-varimp(RFr)
nullVIMAUC80_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(nullVIM80_40f)<-col
colnames(nullVIMAUC80_40f)<-col
colnames(nullVIM80_40r)<-col
colnames(nullVIMAUC80_40r)<-col

write.table(nullVIM80_40f, "nullVIM80_40intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_40f, "nullVIMAUC80_40intstrongfullnew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIM80_40r, "nullVIM80_40intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(nullVIMAUC80_40r, "nullVIMAUC80_40intstrongrednew", row.names=FALSE, col.names=TRUE,quote=FALSE)
