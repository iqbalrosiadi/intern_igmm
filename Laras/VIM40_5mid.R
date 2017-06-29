library(party)

n=100

VIM40_5f<-matrix(0,nrow=n,ncol=100)
VIMAUC40_5f<-matrix(0,nrow=n,ncol=100)
VIM40_5r<-matrix(0,nrow=n,ncol=100)
VIMAUC40_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA40_5intweakfullmid.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA40_5intweakredmid.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM40_5f[i,]<-varimp(RFf)
VIMAUC40_5f[i,]<-varimpAUC(RFf)
VIM40_5r[i,]<-varimp(RFr)
VIMAUC40_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM40_5f)<-col
colnames(VIMAUC40_5f)<-col
colnames(VIM40_5r)<-col
colnames(VIMAUC40_5r)<-col

write.table(VIM40_5f, "VIM40_5intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_5f, "VIMAUC40_5intweakfullmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM40_5r, "VIM40_5intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC40_5r, "VIMAUC40_5intweakredmid", row.names=FALSE, col.names=TRUE,quote=FALSE)
