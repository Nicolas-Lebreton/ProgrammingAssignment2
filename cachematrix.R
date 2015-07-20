## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function cache a matrix in another environment in order to retrieve it instead of recompute it 

makeCacheMatrix <- function(x = matrix()) {
        mat <- NULL
        set <- function(y) {
            x <<- y
            mat <<- NULL
        }
        get <- function() x
        setMatrix <- function(myMatrix) mat <<- myMatrix
        getMatrix <- function() mat
        list(set = set, get = get,
                setMatrix = setMatrix,
                getMatrix = getMatrix)
}




## Write a short comment describing this function

## Make a calculation or retrieve it from cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mat <- x$getMatrix()
        if(!is.null(mat)) {
            message("getting cached data")
            return(mat)
        }
        
        data <- x$get()
        
        mat <- solve(data, ...)
        x$setMatrix(mat)
        
        return(mat)
}
