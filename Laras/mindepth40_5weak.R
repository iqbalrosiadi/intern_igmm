library(randomForestSRC)
n=100

depth15f<-matrix(0,nrow=n,ncol=100)
vimp15f<-matrix(0,nrow=n,ncol=100)
depth3f<-matrix(0,nrow=n,ncol=100)
vimp3f<-matrix(0,nrow=n,ncol=100)
depth15r<-matrix(0,nrow=n,ncol=100)
vimp15r<-matrix(0,nrow=n,ncol=100)
depth3r<-matrix(0,nrow=n,ncol=100)
vimp3r<-matrix(0,nrow=n,ncol=100)

for(i in 1:n){

af<-read.table(paste("DATA40_5intweakfullnew.",i,sep=""),header=TRUE)
yf<-af[,1]
ar<-read.table(paste("DATA40_5intweakrednew.",i,sep=""),header=TRUE)
yr<-ar[,1]

bf<-var.select(yf~.,af,ntree=1000,mtry=1700)
cf<-var.select(yf~.,af,ntree=1000,mtry=1600)
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
vimp15f[i,]<-vim15f
depth3f[i,]<-dep3f
vimp3f[i,]<-vim3f
depth15r[i,]<-dep15r
vimp15r[i,]<-vim15r
depth3r[i,]<-dep3r
vimp3r[i,]<-vim3r

}

col<-c()
for(k in 2:101){
	col<-append(col,paste("V",k,sep=""),after=length(col))
}
colnames(depth15f)<-col
colnames(vimp15f)<-col
colnames(depth3f)<-col
colnames(vimp3f)<-col
colnames(depth15r)<-col
colnames(vimp15r)<-col
colnames(depth3r)<-col
colnames(vimp3r)<-col

write.table(depth15f,"mindepth40_5_1700weakfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(vimp15f,"vimp40_5_1700weakfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth3f,"mindepth40_5_1600weakfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(vimp3f,"vimp40_5_1600weakfullnew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth15r,"mindepth40_5_39weakrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(vimp15r,"vimp40_5_39weakrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(depth3r,"mindepth40_5_27weakrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)
write.table(vimp3r,"vimp40_5_27weakrednew",row.names=FALSE,col.names=TRUE,quote=FALSE)

