#rjungle.scrambled
random_seed<-read.table(paste("input/random_seed"), header=TRUE)
rjungle.2.imp2.rawscore<-c()
rjungle.2.imp2.breiman<-c()
rjungle.2.imp2.liaw<-c()
rjungle.2.imp2.meng<-c()
trjungle.2.importance<-c()
for(j in 1:500){
	rjungle.2.importance2<-read.table(paste("output/scrambled/rjungle.scrambled.",j,".importance2", sep=""), header=TRUE)
	rjungle.2.importance<-read.table(paste("output/scrambled/rjungle.scrambled.",j,".importance", sep=""), header=TRUE)
	#Sorting by Column
	rjungle.2.importance2<-rjungle.2.importance2[order(rjungle.2.importance2[,3]) ,3:8]
	rjungle.2.importance<-rjungle.2.importance[order(rjungle.2.importance[,3]) ,3:4]
	#append from transposed matrix
	rjungle.2.imp2.rawscore<-rbind(rjungle.2.imp2.rawscore,t(rjungle.2.importance2[1:54,3]))
	rjungle.2.imp2.breiman<-rbind(rjungle.2.imp2.breiman, t(rjungle.2.importance2[1:54,4]))
	rjungle.2.imp2.liaw<-rbind(rjungle.2.imp2.liaw,t(rjungle.2.importance2[1:54,5]))
	rjungle.2.imp2.meng<-rbind(rjungle.2.imp2.meng,t(rjungle.2.importance2[1:54,6]))
	trjungle.2.importance<-rbind(trjungle.2.importance,t(rjungle.2.importance[1:54,2]))
}
colnames(random_seed)<-paste("rseed")
colnames(trjungle.2.importance)<-t(rjungle.2.importance[,1])
colnames(rjungle.2.imp2.rawscore)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.breiman)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.liaw)<-t(rjungle.2.importance2[,1])
colnames(rjungle.2.imp2.meng)<-t(rjungle.2.importance2[,1])
trjungle.2.importance<-trjungle.2.importance
rjungle.2.imp2.rawscore<-rjungle.2.imp2.rawscore
rjungle.2.imp2.breiman<-rjungle.2.imp2.breiman
rjungle.2.imp2.liaw<-rjungle.2.imp2.liaw
rjungle.2.imp2.meng<-rjungle.2.imp2.meng

write.table(trjungle.2.importance, "output/scrambled/rj.scrambled.importance", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.rawscore, "output/scrambled/rj.scrambled.importance2.rawscore", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.breiman, "output/scrambled/rj.scrambled.importance2.breiman", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.liaw, "output/scrambled/rj.scrambled.importance2.liaw", row.names=FALSE, col.names=TRUE,quote=FALSE)
write.table(rjungle.2.imp2.meng, "output/scrambled/rj.scrambled.importance2.meng", row.names=FALSE, col.names=TRUE,quote=FALSE)

