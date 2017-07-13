
#loading for median
RFSC.VIM_RF19.imp.median<-read.table(paste("output/RFSC.VIM_RF19.imp.median"), header=TRUE)
party.varVIM.imp.median<-read.table(paste("output/party.varVIM.imp.median"), header=TRUE)
party.varVIMAUC.imp.median<-read.table(paste("output/party.varVIMAUC.imp.median"), header=TRUE)
rj.importance.median<-read.table(paste("output/rj.importance.median"), header=TRUE)
rj.importance2.breiman.median<-read.table(paste("output/rj.importance2.breiman.median"), header=TRUE)
rj.importance2.liaw.median<-read.table(paste("output/rj.importance2.liaw.median"), header=TRUE)


#loading for H0
RFSC.VIM_RF19.imp.scrambled<-read.table(paste("input/scrambled/RFSC.VIM_RF19.scrambled.importance"), header=TRUE)
party.varVIM.imp.scrambled<-read.table(paste("input/scrambled/party.varVIM.scrambled.importance"), header=TRUE)
party.varVIMAUC.imp.scrambled<-read.table(paste("input/scrambled/party.varVIMAUC.scrambled.importance"), header=TRUE)
rj.importance.scrambled<-read.table(paste("input/scrambled/rj.scrambled.importance"), header=TRUE)
rj.importance2.breiman.scrambled<-read.table(paste("input/scrambled/rj.scrambled.importance2.breiman"), header=TRUE)
rj.importance2.liaw.scrambled<-read.table(paste("input/scrambled/rj.scrambled.importance2.liaw"), header=TRUE)
colnamess<-names(RFSC.VIM_RF19.imp.median)


RFSC.VIM_RF19.imp.median.tmp<-c()
party.varVIM.imp.median.tmp<-c()
party.varVIMAUC.imp.median.tmp<-c()
rj.importance.median.tmp<-c()
rj.importance2.breiman.median.tmp<-c()
rj.importance2.liaw.median.tmp<-c()

for(i in 1:53) {
	RFSC.VIM_RF19.imp.median.tmp<-cbind(RFSC.VIM_RF19.imp.median.tmp,length(RFSC.VIM_RF19.imp.scrambled[which(RFSC.VIM_RF19.imp.scrambled[,i]>RFSC.VIM_RF19.imp.median[1,i]),i]))	
	party.varVIM.imp.median.tmp<-cbind(party.varVIM.imp.median.tmp,length(party.varVIM.imp.scrambled[which(party.varVIM.imp.scrambled[,i]>party.varVIM.imp.median[1,i]),i]))
	party.varVIMAUC.imp.median.tmp<-cbind(party.varVIMAUC.imp.median.tmp,length(party.varVIMAUC.imp.scrambled[which(party.varVIMAUC.imp.scrambled[,i]>party.varVIMAUC.imp.median[1,i]),i]))
	rj.importance.median.tmp<-cbind(rj.importance.median.tmp,length(rj.importance.scrambled[which(rj.importance.scrambled[,i]>rj.importance.median[1,i]),i]))
	rj.importance2.breiman.median.tmp<-cbind(rj.importance2.breiman.median.tmp,length(rj.importance2.breiman.scrambled[which(rj.importance2.breiman.scrambled[,i]>rj.importance2.breiman.median[1,i]),i]))
	rj.importance2.liaw.median.tmp<-cbind(rj.importance2.liaw.median.tmp,length(rj.importance2.liaw.scrambled[which(rj.importance2.liaw.scrambled[,i]>rj.importance2.liaw.median[1,i]),i]))
}

colnames(RFSC.VIM_RF19.imp.median.tmp)<-colnamess
colnames(party.varVIM.imp.median.tmp)<-colnamess
colnames(party.varVIMAUC.imp.median.tmp)<-colnamess
colnames(rj.importance.median.tmp)<-colnamess
colnames(rj.importance2.breiman.median.tmp)<-colnamess
colnames(rj.importance2.liaw.median.tmp)<-colnamess

RFSC.VIM_RF19.imp.median<-rbind(RFSC.VIM_RF19.imp.median,RFSC.VIM_RF19.imp.median.tmp)
party.varVIM.imp.median<-rbind(party.varVIM.imp.median,party.varVIM.imp.median.tmp)
party.varVIMAUC.imp.median<-rbind(party.varVIMAUC.imp.median,party.varVIMAUC.imp.median.tmp)
rj.importance.median<-rbind(rj.importance.median,rj.importance.median.tmp)
rj.importance2.breiman.median<-rbind(rj.importance2.breiman.median,rj.importance2.breiman.median.tmp)
rj.importance2.liaw.median<-rbind(rj.importance2.liaw.median,rj.importance2.liaw.median.tmp)

RFSC.VIM_RF19.imp.median.tmp<-c()
party.varVIM.imp.median.tmp<-c()
party.varVIMAUC.imp.median.tmp<-c()
rj.importance.median.tmp<-c()
rj.importance2.breiman.median.tmp<-c()
rj.importance2.liaw.median.tmp<-c()

for(i in 1:53) {
	RFSC.VIM_RF19.imp.median.tmp<-cbind(RFSC.VIM_RF19.imp.median.tmp,length(RFSC.VIM_RF19.imp.scrambled[which(RFSC.VIM_RF19.imp.scrambled[,i]>RFSC.VIM_RF19.imp.median[1,i]),i])/500)	
	party.varVIM.imp.median.tmp<-cbind(party.varVIM.imp.median.tmp,length(party.varVIM.imp.scrambled[which(party.varVIM.imp.scrambled[,i]>party.varVIM.imp.median[1,i]),i])/500)
	party.varVIMAUC.imp.median.tmp<-cbind(party.varVIMAUC.imp.median.tmp,length(party.varVIMAUC.imp.scrambled[which(party.varVIMAUC.imp.scrambled[,i]>party.varVIMAUC.imp.median[1,i]),i])/500)
	rj.importance.median.tmp<-cbind(rj.importance.median.tmp,length(rj.importance.scrambled[which(rj.importance.scrambled[,i]>rj.importance.median[1,i]),i])/500)
	rj.importance2.breiman.median.tmp<-cbind(rj.importance2.breiman.median.tmp,length(rj.importance2.breiman.scrambled[which(rj.importance2.breiman.scrambled[,i]>rj.importance2.breiman.median[1,i]),i])/500)
	rj.importance2.liaw.median.tmp<-cbind(rj.importance2.liaw.median.tmp,length(rj.importance2.liaw.scrambled[which(rj.importance2.liaw.scrambled[,i]>rj.importance2.liaw.median[1,i]),i])/500)
}

colnames(RFSC.VIM_RF19.imp.median.tmp)<-colnamess
colnames(party.varVIM.imp.median.tmp)<-colnamess
colnames(party.varVIMAUC.imp.median.tmp)<-colnamess
colnames(rj.importance.median.tmp)<-colnamess
colnames(rj.importance2.breiman.median.tmp)<-colnamess
colnames(rj.importance2.liaw.median.tmp)<-colnamess


RFSC.VIM_RF19.imp.median<-rbind(RFSC.VIM_RF19.imp.median,RFSC.VIM_RF19.imp.median.tmp)
party.varVIM.imp.median<-rbind(party.varVIM.imp.median,party.varVIM.imp.median.tmp)
party.varVIMAUC.imp.median<-rbind(party.varVIMAUC.imp.median,party.varVIMAUC.imp.median.tmp)
rj.importance.median<-rbind(rj.importance.median,rj.importance.median.tmp)
rj.importance2.breiman.median<-rbind(rj.importance2.breiman.median,rj.importance2.breiman.median.tmp)
rj.importance2.liaw.median<-rbind(rj.importance2.liaw.median,rj.importance2.liaw.median.tmp)

write.table(RFSC.VIM_RF19.imp.median, file = "result/RFSC.VIM_RF19.imp.median.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")
write.table(party.varVIM.imp.median, file = "result/party.varVIM.imp.median.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")
write.table(party.varVIMAUC.imp.median, file = "result/party.varVIMAUC.imp.media.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")
write.table(rj.importance.median, file = "result/rj.importance.median.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")
write.table(rj.importance2.breiman.median, file = "result/rj.importance2.breiman.median.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")
write.table(rj.importance2.liaw.median, file = "result/rj.importance2.liaw.median.csv", row.names=FALSE, na="",col.names=TRUE, sep=",")



