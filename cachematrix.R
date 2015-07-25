makeCacheMatrix = function(a=matrix()) {
	inv = NULL
	set = function(b) {
		a<<-b
		inv <<- NULL
	}
	get = function()a 
	setinverse = function(inverse) inv <<- inverse
	getinverse = function() inv
	list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

cacheSolve = function(a, ...) {
	inv = a$getinverse()
	if(!is.null(inv)) {
		message("getting cached data.")
		return (inv)
	}
	data = a$get()
	inv = solve(data)
	a$setinverse(inv)
	inv
}
