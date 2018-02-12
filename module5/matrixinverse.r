# Generate a matrix and display its inverse and determinant

cat("The generated 100x100 matrix is:\n")

# Set the random seed so we get the same matrix every time
set.seed(123)

# Create the matrix using runif() to get random numbers)
A <- matrix(runif(100, min=1, max=100), nrow=10)

# Show the values in A
A

# Get the inverse of A
cat("The inverse of the matrix is:\n")
solve(A)

# Get the determinant of A
cat("The determinant of the matrix is:\n")
det(A)
