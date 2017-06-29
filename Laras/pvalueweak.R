library(lmtest)

n=500
p1<-c()

for(i in 1:n){
	data1<-read.table(paste("DATA80_40intweakfull033.",i,sep=""),header=T)

	y1=data1[,1]
	x1=data1[,2]
	x89=data1[,90]
	reg1<-lm(y1~x1+x89+x1:x89)
	a1<-summary(reg1)
	reg0<-lm(y1~1)

	lrtc<-lrtest(reg1,reg0)
	p1<-append(p1, lrtc$"Pr(>Chisq)"[2],after=length(p1))
}

sigp<-length(p1[p1<0.05])