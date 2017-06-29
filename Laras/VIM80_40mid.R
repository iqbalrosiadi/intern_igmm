library(party)

n=100

VIM80_40f<-matrix(0,nrow=n,ncol=100)
VIMAUC80_40f<-matrix(0,nrow=n,ncol=100)
VIM80_40r<-matrix(0,nrow=n,ncol=100)
VIMAUC80_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA80_40intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA80_40intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM80_40f[i,]<-varimp(RFf)
VIMAUC80_40f[i,]<-varimpAUC(RFf)
VIM80_40r[i,]<-varimp(RFr)
VIMAUC80_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM80_40f)<-col
colnames(VIMAUC80_40f)<-col
colnames(VIM80_40r)<-col
colnames(VIMAUC80_40r)<-col

write.table(VIM80_40f, "VIM80_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC80_40f, "VIMAUC80_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM80_40r, "VIM80_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC80_40r, "VIMAUC80_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
