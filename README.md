# Programming Assignment 2 – Caching the Inverse of a Matrix

This repo contains my solution for **Programming Assignment 2** (Lexical Scoping) from the Coursera R Programming course.

The idea is simple:  
Matrix inversion can be expensive, so instead of computing it over and over, we **cache** the result the first time and then reuse it.

---

## Functions

- **`makeCacheMatrix(x = matrix())`**  
  Creates a special matrix object that can:
  - store a matrix
  - cache its inverse
  - let me set/get both

- **`cacheSolve(x, ...)`**  
  Returns the inverse of the matrix created by `makeCacheMatrix()`.  
  - If the inverse has already been calculated and cached, it just returns the cached value.  
  - If not, it computes the inverse, caches it, and then returns it.

> Under the hood, inversion uses R’s built-in `solve()` function.  
> For this assignment, we assume the matrix is always invertible.

---

## How to use

The code lives in `programming_assignment2_lexical_scoping.R`.  
Here’s how you can run and test it:

```r
source("programming_assignment2_lexical_scoping.R")

# make a matrix
m <- matrix(c(2, 0, 0, 2), 2, 2)

# wrap it into a special object
cm <- makeCacheMatrix(m)

# first call computes the inverse
cacheSolve(cm)
#      [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5

# second call uses the cached result
cacheSolve(cm)
# getting cached data
#      [,1] [,2]
# [1,]  0.5  0.0
# [2,]  0.0  0.5

# if I change the matrix, the cache resets
cm$set(matrix(c(4, 7, 2, 6), 2, 2))
cacheSolve(cm)  # computes inverse again
