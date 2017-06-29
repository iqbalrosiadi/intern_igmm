library(party)

n=100

VIM80_5f<-matrix(0,nrow=n,ncol=100)
VIMAUC80_5f<-matrix(0,nrow=n,ncol=100)
VIM80_5r<-matrix(0,nrow=n,ncol=100)
VIMAUC80_5r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA80_5intweakfullsingle.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA80_5intweakredsingle.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y2~.,data=dataf,controls=control)
RFr<-cforest(y3~.,data=datar,controls=control)

VIM80_5f[i,]<-varimp(RFf)
VIMAUC80_5f[i,]<-varimpAUC(RFf)
VIM80_5r[i,]<-varimp(RFr)
VIMAUC80_5r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V.",j+1, sep="")
}
colnames(VIM80_5f)<-col
colnames(VIMAUC80_5f)<-col
colnames(VIM80_5r)<-col
colnames(VIMAUC80_5r)<-col

write.table(VIM80_5f, "VIM80_5intweakfullsingle", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIMAUC80_5f, "VIMAUC80_5intweakfullsingle", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIM80_5r, "VIM80_5intweakredsingle", row.names=FALSE, col.names=FALSE,quote=FALSE)
write.table(VIMAUC80_5r, "VIMAUC80_5intweakredsingle", row.names=FALSE, col.names=FALSE,quote=FALSE)
