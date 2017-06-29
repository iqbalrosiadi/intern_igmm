library(randomForestSRC)
n=100

depth15f<-matrix(0,nrow=n,ncol=100)
nullvimp15f<-matrix(0,nrow=n,ncol=100)
depth3f<-matrix(0,nrow=n,ncol=100)
nullvimp3f<-matrix(0,nrow=n,ncol=100)
depth15r<-matrix(0,nrow=n,ncol=100)
nullvimp15r<-matrix(0,nrow=n,ncol=100)
depth3r<-matrix(0,nrow=n,ncol=100)
nullvimp3r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

af<-read.table(paste("nullDATA80_40intstrongfullnew.",i,sep=""),header=TRUE)
yf<-af[,1]
ar<-read.table(paste("nullDATA80_40intstrongrednew.",i,sep=""),header=TRUE)
yr<-ar[,1]

bf<-var.select(yf~.,af,ntree=1000,mtry=39)
cf<-var.select(yf~.,af,ntree=1000,mtry=27)
br<-var.select(yr~.,ar,ntree=1000,mtry=39)
cr<-var.select(yr~.,ar,ntree=1000,mtry=27)

df<-bf$varselect
vf<-cf$varselect
dr<-br$varselect
vr<-cr$varselect

dep15f<-c()
vim15f<-c()
dep3f<-c()
vim3f<-c()
dep15r<-c()
vim15r<-c()
dep3r<-c()
vim3r<-c()

for(j in 2:101){
	p1f=rownames(df)==paste("V",j,sep="")
	dep15f<-append(dep15f,df[p1f,1],after=length(dep15f))
	vim15f<-append(vim15f,df[p1f,2],after=length(vim15f))
	p2f=rownames(vf)==paste("V",j,sep="")
	dep3f<-append(dep3f,vf[p2f,1],after=length(dep3f))
	vim3f<-append(vim3f,vf[p2f,2],after=length(vim3f))
        p1r=rownames(dr)==paste("V",j,sep="")
        dep15r<-append(dep15r,dr[p1r,1],after=length(dep15r))
        vim15r<-append(vim15r,dr[p1r,2],after=length(vim15r))
        p2r=rownames(vr)==paste("V",j,sep="")
        dep3r<-append(dep3r,vr[p2r,1],after=length(dep3r))
        vim3r<-append(vim3r,vr[p2r,2],after=length(vim3r))

}

depth15f[i,]<-dep15f
nullvimp15f[i,]<-vim15f
depth3f[i,]<-dep3f
nullvimp3f[i,]<-vim3f
depth15r[i,]<-dep15r
nullvimp15r[i,]<-vim15r
depth3r[i,]<-dep3r
nullvimp3r[i,]<-vim3r

}

col<-c()
for(k in 2:101){
	col<-append(col,paste("V",k,sep=""),after=length(col))
}
colnames(depth15f)<-col
colnames(nullvimp15f)<-col
colnames(depth3f)<-col
colnames(nullvimp3f)<-col
colnames(depth15r)<-col
colnames(nullvimp15r)<-col
colnames(depth3r)<-col
colnames(nullvimp3r)<-col

write.table(depth15f,"nullmindepth80_40_39strongfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(nullvimp15f,"nullvimp80_40_39strongfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth3f,"nullmindepth80_40_27strongfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(nullvimp3f,"nullvimp80_40_27strongfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth15r,"nullmindepth80_40_39strongrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(nullvimp15r,"nullvimp80_40_39strongrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth3r,"nullmindepth80_40_27strongrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(nullvimp3r,"nullvimp80_40_27strongrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)

