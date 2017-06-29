library(party)

n=100

VIM10_40f<-matrix(0,nrow=n,ncol=100)
VIMAUC10_40f<-matrix(0,nrow=n,ncol=100)
VIM10_40r<-matrix(0,nrow=n,ncol=100)
VIMAUC10_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA10_40intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA10_40intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM10_40f[i,]<-varimp(RFf)
VIMAUC10_40f[i,]<-varimpAUC(RFf)
VIM10_40r[i,]<-varimp(RFr)
VIMAUC10_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM10_40f)<-col
colnames(VIMAUC10_40f)<-col
colnames(VIM10_40r)<-col
colnames(VIMAUC10_40r)<-col

write.table(VIM10_40f, "VIM10_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_40f, "VIMAUC10_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM10_40r, "VIM10_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_40r, "VIMAUC10_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
