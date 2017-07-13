
RFSC.VIM_RF19.importance<-read.table(paste("input/importance/RFSC.VIM_RF19.importance"), header=TRUE)
party.varVIM.importance<-read.table(paste("input/importance/party.varVIM.importance"), header=TRUE)
party.varVIMAUC.importance<-read.table(paste("input/importance/party.varVIMAUC.importance"), header=TRUE)
party.varVIMAUC.importance<-party.varVIMAUC.importance[,order(colnames(party.varVIMAUC.importance))]

rj.importance<-read.table(paste("input/importance/rj.importance"), header=TRUE)
rj.importance2.breiman<-read.table(paste("input/importance/rj.importance2.breiman"), header=TRUE)
rj.importance2.liaw<-read.table(paste("input/importance/rj.importance2.liaw"), header=TRUE)


RFSC.VIM_RF19.imp.median<-c()
party.varVIM.imp.median<-c()
party.varVIMAUC.imp.median<-c()
rj.importance.median<-c()
rj.importance2.breiman.median<-c()
rj.importance2.liaw.median<-c()

n=dim(RFSC.VIM_RF19.importance)[2]
for(i in 1:n) {

	RFSC.VIM_RF19.imp.median<-cbind(RFSC.VIM_RF19.imp.median,median(RFSC.VIM_RF19.importance[,i]))
	party.varVIM.imp.median<-cbind(party.varVIM.imp.median,median(party.varVIM.importance[,i]))
	party.varVIMAUC.imp.median<-cbind(party.varVIMAUC.imp.median,median(party.varVIMAUC.importance[,i]))

	rj.importance.median<-cbind(rj.importance.median,median(rj.importance[,i]))
	rj.importance2.breiman.median<-cbind(rj.importance2.breiman.median,median(rj.importance2.breiman[,i]))
	rj.importance2.liaw.median<-cbind(rj.importance2.liaw.median,median(rj.importance2.liaw[,i]))

}

colnames(RFSC.VIM_RF19.imp.median)<-names(RFSC.VIM_RF19.importance)
colnames(party.varVIM.imp.median)<-names(party.varVIM.importance)
colnames(party.varVIMAUC.imp.median)<-names(party.varVIMAUC.importance)
colnames(rj.importance.median)<-names(rj.importance)
colnames(rj.importance2.breiman.median)<-names(rj.importance2.breiman)
colnames(rj.importance2.liaw.median)<-names(rj.importance2.liaw)

write.table(RFSC.VIM_RF19.imp.median, "output/RFSC.VIM_RF19.imp.median", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(party.varVIM.imp.median, "output/party.varVIM.imp.median", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(party.varVIMAUC.imp.median, "output/party.varVIMAUC.imp.median", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rj.importance.median, "output/rj.importance.median", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rj.importance2.breiman.median, "output/rj.importance2.breiman.median", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rj.importance2.liaw.median, "output/rj.importance2.liaw.median", row.names=FALSE, col.names=TRUE,quote=FALSE)

