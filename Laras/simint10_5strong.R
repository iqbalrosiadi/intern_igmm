rmvnormc<-function (n, mean = rep(0, nrow(sigma)), sigma = diag(length(mean)),
        corr=diag(length(mean)), method = c("eigen", "svd", "chol"), pre0.9_9994 = FALSE)
{
    if (!isSymmetric(sigma, tol = sqrt(.Machine$double.eps),
        check.attributes = FALSE)) {
        stop("sigma must be a symmetric matrix")
    }
    if (!isSymmetric(corr, tol = sqrt(.Machine$double.eps),
        check.attributes = FALSE)) {
        stop("corr must be a symmetric matrix")
    }

    if (length(mean) != nrow(sigma)) {
        stop("mean and sigma have non-conforming size")
    }

    if (length(mean) != nrow(corr)) {
        stop("mean and corr have non-conforming size")
    }

    sigma1<-matrix(0,nrow=nrow(sigma),ncol=ncol(sigma))
        for(i in 1:nrow(sigma)){
        for(j in 1:nrow(sigma)){
                sigma1[i,j]<-sqrt(diag(sigma)[i])*sqrt(diag(sigma)[j])*corr[i,j]
        }
}

    dimnames(sigma1) <- NULL
    if (!isTRUE(all.equal(sigma1, t(sigma1)))) {
        warning("sigma is numerically not symmetric")
    }
    method <- match.arg(method)
    if (method == "eigen") {
        ev <- eigen(sigma1, symmetric = TRUE)
        if (!all(ev$values >= -sqrt(.Machine$double.eps) * abs(ev$values[1]))) {
            warning("sigma is numerically not positive definite")
        }
        retval <- ev$vectors %*% diag(sqrt(ev$values), length(ev$values)) %*%
            t(ev$vectors)
    }
    else if (method == "svd") {
        sigsvd <- svd(sigma1)
        if (!all(sigsvd$d >= -sqrt(.Machine$double.eps) * abs(sigsvd$d[1]))) {
            warning("sigma is numerically not positive definite")
        }
        retval <- t(sigsvd$v %*% (t(sigsvd$u) * sqrt(sigsvd$d)))
    }
    else if (method == "chol") {
        retval <- chol(sigma1, pivot = TRUE)
        o <- order(attr(retval, "pivot"))
        retval <- retval[, o]
    }
    retval <- matrix(rnorm(n * ncol(sigma1)), nrow = n, byrow = !pre0.9_9994) %*%
        retval
    retval <- sweep(retval, 2, mean, "+")
    colnames(retval) <- names(mean)
    retval
}

media<-c(rep(0,100))
sigma<-diag(length(media))


corr1<-matrix(0,nrow=5,ncol=5)
for(i in 1:5){
        for(j in 1:5){
                if(i==j){
                        corr1[i,j]=1
                }
                else if(i!=j){
                        if(i==3 | j==3){
                                corr1[i,j]=-0.10
                                corr1[j,i]=corr1[i,j]
                        }
                        else if(i!=3 & j!=3){
                                corr1[i,j]=0.10
                                corr1[j,i]=corr1[i,j]
                        }
                }
        }

}

ceros1<-matrix(0,nrow=95,ncol=5)
corr1<-rbind(corr1,ceros1)
ceros2<-matrix(0,nrow=5,ncol=95)
corr2<-diag(95)
corr2<-rbind(ceros2,corr2)
corr<-cbind(corr1,corr2)

n=100
###############################
#generate data
#################################
for(i in 1:n){

        x<-rmvnormc(1000,mean=media,sigma=sigma,corr=corr)
        #e1 = rnorm(1000,0,1)
        e2 = rnorm(1000,0,0.05)

          x2=x[,1]
          x90=x[,89]

y2<-x2+x90+x2*x90+e2
y3<-x2*x90+e2

data2<-data.frame(cbind(y2,x))
data3<-data.frame(cbind(y3,x))

write.table(data2, paste("DATA10_5intstrongfullnew.",i, sep=""), row.names=FALSE, quote=FALSE)
write.table(data3, paste("DATA10_5intstrongrednew.",i, sep=""), row.names=FALSE, quote=FALSE)
}
