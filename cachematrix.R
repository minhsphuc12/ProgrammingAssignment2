## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
makeCacheMatrix <- function(x) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse = function(solve) m <<- solve
    getinverse = function() m
    list(set = set,get = set,
         setinverse=setinverse,
         getinverse=getinverse)
}

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message('getting cached matrix')
        return(m)
    }
    data <- x$get()
    m <- solve(data,...)
    x$setinverse(m)
    m
}