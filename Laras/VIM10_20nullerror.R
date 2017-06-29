library(party)

n=500

VIM10_20f<-matrix(0,nrow=n,ncol=100)
VIMAUC10_20f<-matrix(0,nrow=n,ncol=100)
VIM10_20r<-matrix(0,nrow=n,ncol=100)
VIMAUC10_20r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

dataf<-read.table(paste("DATA10_20nullerror005.",i, sep=""), header=TRUE)
datar<-read.table(paste("DATA10_20nullerror05.",i, sep=""), header=TRUE)

control<-cforest_control(mtry=39,ntree=1000,replace=FALSE,fraction=0.632)

RFf<-cforest(y1~.,data=dataf,controls=control)
RFr<-cforest(y2~.,data=datar,controls=control)

VIM10_20f[i,]<-varimp(RFf)
VIMAUC10_20f[i,]<-varimpAUC(RFf)
VIM10_20r[i,]<-varimp(RFr)
VIMAUC10_20r[i,]<-varimpAUC(RFr)
}

col<-as.vector(100)
for(j in 1:100){
	col[j]=paste("V",j+1, sep="")
}
colnames(VIM10_20f)<-col
colnames(VIMAUC10_20f)<-col
colnames(VIM10_20r)<-col
colnames(VIMAUC10_20r)<-col

write.table(VIM10_20f, "VIM10_20nullerror005", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_20f, "VIMAUC10_20nullerror005", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIM10_20r, "VIM10_20nullerror05", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(VIMAUC10_20r, "VIMAUC10_20nullerror05", row.names=FALSE, col.names=TRUE,quote=FALSE)
