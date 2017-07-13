random_seed<-read.table(paste("input/random_seed"), header=TRUE)
rjungle.2.imp2.rawscore<-c()
rjungle.2.imp2.breiman<-c()
rjungle.2.imp2.liaw<-c()
rjungle.2.imp2.meng<-c()
trjungle.2.importance<-c()
for(j in 1:500){
	rjungle.2.importance2<-read.table(paste("output/HA_importance/rjungle.",j,".importance2", sep=""), header=TRUE)
	rjungle.2.importance<-read.table(paste("output/HA_importance/rjungle.",j,".importance", sep=""), header=TRUE)
	#Sorting by Column
	rjungle.2.importance2<-rjungle.2.importance2[order(rjungle.2.importance2[,3]) ,3:8]
	rjungle.2.importance<-rjungle.2.importance[order(rjungle.2.importance[,3]) ,3:4]
	#append from transposed matrix
	rjungle.2.imp2.rawscore<-rbind(rjungle.2.imp2.rawscore,t(rjungle.2.importance2[1:53,3]))
	rjungle.2.imp2.breiman<-rbind(rjungle.2.imp2.breiman, t(rjungle.2.importance2[1:53,4]))
	rjungle.2.imp2.liaw<-rbind(rjungle.2.imp2.liaw,t(rjungle.2.importance2[1:53,5]))
	rjungle.2.imp2.meng<-rbind(rjungle.2.imp2.meng,t(rjungle.2.importance2[1:53,6]))
	trjungle.2.importance<-rbind(trjungle.2.importance,t(rjungle.2.importance[1:53,2]))
}
#colnames(random_seed)<-paste("rseed")
colnames(trjungle.2.importance)<-t(rjungle.2.importance[,1])
colnames(rjungle.2.imp2.rawscore)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.breiman)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.liaw)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.meng)<-t(rjungle.2.importance2[,1])
#trjungle.2.importance<-cbind(random_seed,trjungle.2.importance)
#rjungle.2.imp2.rawscore<-cbind(random_seed,rjungle.2.imp2.rawscore)
#rjungle.2.imp2.breiman<-cbind(random_seed,rjungle.2.imp2.breiman)
#rjungle.2.imp2.liaw<-cbind(random_seed,rjungle.2.imp2.liaw)
#rjungle.2.imp2.meng<-cbind(random_seed,rjungle.2.imp2.meng)

write.table(trjungle.2.importance, "output/HA_importance/rj.importance", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.rawscore, "output/HA_importance/rj.importance2.rawscore", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.breiman, "output/HA_importance/rj.importance2.breiman", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.liaw, "output/HA_importance/rj.importance2.liaw", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.meng, "output/HA_importance/rj.importance2.meng", row.names=FALSE, col.names=TRUE,quote=FALSE)

