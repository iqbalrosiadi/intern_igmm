library(party)

n=100

VIM40_20f<-matrix(0,nrow=n,ncol=100)
VIMAUC40_20f<-matrix(0,nrow=n,ncol=100)
VIM40_20r<-matrix(0,nrow=n,ncol=100)
VIMAUC40_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA40_20intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA40_20intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM40_20f[i,]<-varimp(RFf)
VIMAUC40_20f[i,]<-varimpAUC(RFf)
VIM40_20r[i,]<-varimp(RFr)
VIMAUC40_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM40_20f)<-col
colnames(VIMAUC40_20f)<-col
colnames(VIM40_20r)<-col
colnames(VIMAUC40_20r)<-col

write.table(VIM40_20f, "VIM40_20intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_20f, "VIMAUC40_20intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM40_20r, "VIM40_20intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_20r, "VIMAUC40_20intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
