## This function will store the matrix and return the matrix that is stored

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL #initially sets m to a null vallue
  set <- function(y) {#the set function has x variable which is set to y and m is NULL
    x <<- y
    m <<- NULL
  }
  get <- function() x #the get function returns x
  setmtx <-  function(solve) m <<- solve 
  getmtx <- function() m #returns the matrix that is stored
  list(set = set, get = get,
       setmtx = setmtx,
       getmtx = getmtx)
}


## This function will return the inverse of the passed in matrix using the Solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmtx() # store the matrix 
  if(!is.null(m)) {# check to see if there is a stored matrix
    message("getting cached data")
    return(m) # the function will retur
  }
  data <- x$get()#pulls the matrix from the ca
  m <- solve(data,LINPACK=FALSE,...)#the inverse of the matrix is stored in m
  x$setmtx(m)#the inverse is now stored back to the cache
  m
}
