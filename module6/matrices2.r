# Create matrices A and B
A <- matrix(c(2,0,1,3), ncol=2)
B <- matrix(c(5,2,4,-1), ncol=2)
# Output A + B and A - B
A + B
A - B

# Create and print a matrix with (4, 1, 2, 3) as the diagonal
diag(c(4, 1, 2, 3))

# Create a 5x5 matrix with a diagonal of 3s
C <- diag(rep.int(3, 5))
# Set the last 4 elements in row 1 to 1s
C[1,2:5] <- rep.int(1, 4)
# Set the last 4 elements in column 1 to 2s
C[2:5,1] <- rep.int(2, 4)
# Print the result
C
