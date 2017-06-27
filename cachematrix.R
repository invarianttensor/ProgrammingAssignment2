## The makeCasheMatrix function creates an special object that calculates the inverse of a give
## matrix and cashes it in the parent environment. e.g., a call to this function like, 
#  makeCasheMatrix(matrix(c(1,5,9,12),nrow=2,ncol=2))
#  will create the objcet. The set function takes care of preexisting garbage values in 'inv'
# variable and puts the input matrix in x. The get function retrieves the value of x from 
# parent environment since x is not defined in get environment. setinverse and getinverse does 
# similar stuff. The list asigns the variables/functions to their parent environment and at the 
# same time they become named variable so that $ symbol could be used later to retrieve their values.


makeCacheMatrix <- function(x = matrix()) {
            
            inv <- NULL

            set <- function(y)  {
                    x <<- y
                    inv <<- NULL
            }

            get <- function() x

            setinverse <- function(inverse) inv <<- solve
            getinverse <- function() inv
            

            list(set = set, get = get,
              setinverse = setinverse,
              getinverse = getinverse)
}


## cacheSolve function calculates the inverse of the matrix object created in the form using 
# makeCacheMatrix. So, first it checks if the inverse of the matrix is NULL or not. If not then
# it gets the cached inverse matrix. If the inv is NULL then it actually calculated the inverse.


cacheSolve <- function(x, ...) {
        
        inv <- x$getinverse()

        if(!is.null(inv)) {
          message("getting cached data")
          return(inv)
        }

        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(m)

        inv
}
