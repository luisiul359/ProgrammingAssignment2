source("cachematrix.R")

v <- 2000
x <- matrix(runif(v*v),nrow=v)
m <- makeCacheMatrix(x)

ptm <- proc.time()
dummy1<-cacheSolve(m)
proc.time() - ptm
ptm <- proc.time()
dummy2<-cacheSolve(m)
proc.time() - ptm

identical(dummy1,dummy2)