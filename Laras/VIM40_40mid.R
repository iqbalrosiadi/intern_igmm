library(party)

n=100

VIM40_40f<-matrix(0,nrow=n,ncol=100)
VIMAUC40_40f<-matrix(0,nrow=n,ncol=100)
VIM40_40r<-matrix(0,nrow=n,ncol=100)
VIMAUC40_40r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA40_40intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA40_40intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM40_40f[i,]<-varimp(RFf)
VIMAUC40_40f[i,]<-varimpAUC(RFf)
VIM40_40r[i,]<-varimp(RFr)
VIMAUC40_40r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM40_40f)<-col
colnames(VIMAUC40_40f)<-col
colnames(VIM40_40r)<-col
colnames(VIMAUC40_40r)<-col

write.table(VIM40_40f, "VIM40_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_40f, "VIMAUC40_40intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM40_40r, "VIM40_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_40r, "VIMAUC40_40intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
