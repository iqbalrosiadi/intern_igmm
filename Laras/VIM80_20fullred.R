library(party)

n=100

VIM80_20f<-matrix(0,nrow=n,ncol=100)
VIMAUC80_20f<-matrix(0,nrow=n,ncol=100)
VIM80_20r<-matrix(0,nrow=n,ncol=100)
VIMAUC80_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA80_20intweakfullnew.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA80_20intweakrednew.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=1700,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM80_20f[i,]<-varimp(RFf)
VIMAUC80_20f[i,]<-varimpAUC(RFf)
VIM80_20r[i,]<-varimp(RFr)
VIMAUC80_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V.",j+1, sep="")
}
colnames(VIM80_20f)<-col
colnames(VIMAUC80_20f)<-col
colnames(VIM80_20r)<-col
colnames(VIMAUC80_20r)<-col

write.table(VIM80_20f, "VIM80_20intweakfullnew", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIMAUC80_20f, "VIMAUC80_20intweakfullnew", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIM80_20r, "VIM80_20intweakrednew", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIMAUC80_20r, "VIMAUC80_20intweakrednew", row.names=FALSE, col.names=FALSE,quote=FALSE)
