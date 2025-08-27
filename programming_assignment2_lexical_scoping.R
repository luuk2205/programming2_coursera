## makeCacheMatrix -----------------------------------------------------------
## creates a special matrix object that can store its inverse
## basically just a list of functions I can call later
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL   # start with no inverse
  
  set <- function(y) {
    x <<- y
    inv <<- NULL   # if I change the matrix, old inverse is useless
  }
  
  get <- function() x            # return matrix
  setinverse <- function(inverse) inv <<- inverse  # save inverse
  getinverse <- function() inv   # return inverse (if it exists)
  
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )
}

## cacheSolve ---------------------------------------------------------------
## checks if inverse is already stored
## if yes -> just return it
## if not -> calculate, store it, and return it
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  
  if (!is.null(inv)) {
    message("getting cached data")  # tells me when it doesn’t recompute
    return(inv)
  }
  
  mat <- x$get()
  inv <- solve(mat, ...)    # compute inverse (matrix must be invertible)
  x$setinverse(inv)         # store for next time
  inv
}