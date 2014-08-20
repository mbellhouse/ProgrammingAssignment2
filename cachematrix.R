## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  answer <- NULL    
  
  #  These next three functions are'methods' that can be used by cacheSolve
  
  get_original_data <- function() { x }         # when called, this function returns the value of the original object x that is passed to makeCacheMatrix
  
  super_assign_answer <- function(answer)  # when called this function will 
  { answer <<- answer}                    # assign the value of calculation to the answer object and store answer using superassignment
  
  return_answer <- function() { answer }        # when called this functionill return the cached value of answer
 
  
  list(get_original_data = get_original_data,    # MakeCacheMatrix returns a list of method objects holding above functions.       
       super_assign_answer = super_assign_answer,     
       return_answer = return_answer)  
  
}

## Write a short comment describing this function

cacheSolve <- function(output_makeCacheMatrix=list, ...) { #this function takes a list (generated from makeCacheMatrix) as input 
  answer <- output_makeCacheMatrix$return_answer()               # accesses the object 'x' and gets the value of the mean
  if(!is.null(answer)) {              # if mean was already cached (not NULL) ...
    
    message("getting cached data")  # ... send this message to the console
    return(answer)                       # ... and return the mean ... "return" ends 
    #   the function cachemean(), note
  }
  original_data <- output_makeCacheMatrix$get_original_data()        # we reach this code only if x$getmean() returned NULL
  answer <- solve(original_data, ...)   # if answer was NULL then we have to calculate
  output_makeCacheMatrix$super_assign_answer(answer)           # store the calculated mean value in x (see setmean() in makeVector)
  answer                      # return the mean to the code that called this function
        ## Return a matrix that is the inverse of 'x'
  
}

# example runs
#output_makeCacheMatrix<- makeCacheMatrix(matrix(c(1,2,3,4), 2, 2))     
#cacheSolve(output_makeCacheMatrix) 


