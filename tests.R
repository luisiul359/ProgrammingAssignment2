source("cachematrix.R")

v <- 2000
x <- matrix(runif(v*v),nrow=v)
m <- makeCacheMatrix(x)

ptm <- proc.time()
dummy<-cacheSolve(m)
proc.time() - ptm
ptm <- proc.time()
dummy<-cacheSolve(1m)
proc.time() - ptm
