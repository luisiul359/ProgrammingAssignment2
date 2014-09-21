## makeCacheMatrix function returns a special "matrix". With that special "matrix"
## we can cache the inverse of that matrix (inverse calculation is a custly computation).
##
## With the get and set methods we can obtain or change the matrix. And with 
## setInverse and getInverse we can obtain or change the matrix inverse.
##
## cacheSolve function calculates the inverse of 'x'. If the inverse was cached than
## only return the inverse.



## return a special "matrix" that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Return a matrix that is the inverse of 'x'
## the ... argument is passed to solve function
##
## in this version is assumed that x is always invertible

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
}
