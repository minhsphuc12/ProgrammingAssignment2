
makeCacheMatrix <- function(x) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse = function(solve) m <<- solve
    getinverse = function() m
    list(set = set,get = set,    # this function returns a list with 4 list items  
         setinverse=setinverse, #(they are actually 4 functions wrapped in a list)
         getinverse=getinverse)
}

cacheSolve <- function(x, ...) {
    m <- x$getinverse() #query the x matrix's cache
    if(!is.null(m)) {   #if there is a cache
        message('getting cached matrix')
        return(m)       #just return the cache, no computation needed
    }
    data <- x$get()         #if there's no cache
    m <- solve(data,...)     #we actually compute them here
    x$setinverse(m)           #save the result back to x's cache
    m                            #return the result
}