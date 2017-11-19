# The cachematrix.R file contains two functions, makeCacheMatrix() and 
# cacheSolve(). The first function, makeCacheMatrix() creates 
# an R object that stores a matrix and its inverse. The second function, 
# cachemean() requires an argument of type makeCacheMatrix() in 
# order to retrieve the mean from the cached value that is stored
# in the makeCacheMatrix() object's environment.

# This function caches the inverse of the matrix. The getters and 
# setters are returned in the form of a list. 

makeCacheMatrix <- function(x = matrix()) {
    inv = NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

# The following function first gets the inverse of the matrix, using 
# $getInverse on the function argument. If the inverse is null, it 
# computes the inverse and assigns it using $setInverse function. If the 
# inverse if already present, it returns that cached value. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()
    if(!is.null(inv)){
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setInverse(inv)
    inv
}