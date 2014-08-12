
        ## This two functions will allow caching of a matrix

        ## makeCacheMatrix takes the matrix in the argument and
        ## creates a list of functions that would set the value of the matrix,
        ## get the value of the matrix, set the value of the inverse, and
        ## get the value of the inverse.

        makeCacheMatrix <- function(x = matrix()) {
	        m <- NULL
	        set <- function(y) {
		        x <<- y
		        m <<- NULL
	        }
	get <- function() x
	setinv <- function(solve) m <<- solve
	getinv <- function() m
	list(set = set, get = get,
		setinv = setinv,
		getinv = getinv)
        }


        ## cacheSolve is going to use the list of functions created by the above
        ## and then check if the value of the inverse has been cached; if so,
        ## it will retrieve from the cache and otherwise it finds the inverse and
        ## produce the result

        cacheSolve <- function(x, ...) {
                ## Return a matrix that is the inverse of 'x'
                m <- x$getinv()
                if(!is.null(m)) {
        	        message("getting cached data")
        	        return(m)
                }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
        }