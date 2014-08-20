## makeCacheMatrix creates a list of methods: getting original data, caching answer and returning answer to console

makeCacheMatrix <- function(x = matrix()) {
  
  answer <- NULL    
  
  #  These next three functions are'methods' that can be used by cacheSolve
  
  get_original_data <- function() { x }     # when called, this function returns the value of the original object x that is passed to makeCacheMatrix
  
  super_assign_answer <- function(answer)  # when called this function will 
  { answer <<- answer}                     # assign the value of calculation to the answer object and store answer using superassignment
  
  return_answer <- function() { answer }   # when called this functionill return the cached value of answer
 
  
  list(get_original_data = get_original_data,    # MakeCacheMatrix returns a list of method objects holding above functions.       
       super_assign_answer = super_assign_answer,     # cacheSolve will access these method objects
       return_answer = return_answer)  
  
}

## ## cacheSolve determines whether the matrix inversion calculation already exists, retrieves it if so, 
## or calculates caches and returns the matrix inversion if it does not alreday exist.

cacheSolve <- function(output_makeCacheMatrix=list, ...) { #this function takes a list (generated from makeCacheMatrix) as input 
  answer <- output_makeCacheMatrix$return_answer()         # accesses 'return_answer' from that list and stores the value returned in the answer object
  if(!is.null(answer)) {                                   # if answer was already cached (not NULL) ...
    
    message("getting cached data")                         # ... sends this message to the console
    return(answer)                                         # ... and returns the matrix inversion answer 
    #   the function cachemean(), note
  }
  original_data <- output_makeCacheMatrix$get_original_data()  #  if answer returned is NULL will access original data
  answer <- solve(original_data, ...)                          #  calculates matrix inverse with solve() function and stores in answer object
  output_makeCacheMatrix$super_assign_answer(answer)           # caches the answer object using the super_assign_answer method
  answer                                                       # returns matric inversion answer to the console for user review
  
}

# example runs
# output_makeCacheMatrix<- makeCacheMatrix(matrix(c(1,2,3,4), 2, 2))     
# cacheSolve(output_makeCacheMatrix) 


