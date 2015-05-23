## These functions will store 'cashe' the value of the inverse matrix
## and retrieve it when needed.  
##If it doesn't exit it will go ahead and solve the inverse 


## Make a list of functions that will cashe 'store' the values of the input 
makeCacheMatrix <- function(x = matrix()){
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,setsolve = setsolve, getsolve = getsolve)
}


## This function will retrieve a matrix if it exists and return the inverse or solve for the inverse if it doesn't using solve()
cacheSolve <- function(x,...) {
## Return a matrix that is the inverse of 'x' 
    m <- x$getsolve()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
## Solve for the inverse of  'x' using solve()
    data <- x$get()
    m <- solve(data,...)
    x$setsolve(m)
    m
}