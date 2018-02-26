# Import pryr library
library(pryr)

# Generic functions that work with the selected dataset, "trees"
print(trees)
summary(trees)
plot(trees$Volume)

# Generic function that doesn't work with trees
# mean(trees)

# S3 class for dataset trees
trees_s3 = function(g, h, v) {
	tree = list(Girth = g, Height = h, Volume = v)
	class(tree) <- "trees_s3"
	tree
}

# Define print function for trees_s3
print.trees_s3 <- function(tree) {
	cat("Girth: ", tree$Girth, "\n")
	cat("Height: ", tree$Height, "\n")
	cat("Volume: ", tree$Volume, "\n")
}

# Create tree_s3 objects for each row in dataset trees
cat("Dataset trees as S3 objects:\n")
apply(trees, 1, function(x) trees_s3(x[1],x[2],x[3]))


# S4 class created for dataset trees
setClass("trees_s4",
	representation(
		Girth="numeric",
		Height="numeric",
		Volume="numeric")
)

# Define show function for trees_s4
setMethod("show", "trees_s4",
	function(object) {
		cat("Girth: ", object@Girth, "\n")
		cat("Height: ", object@Height, "\n")
		cat("Volume: ", object@Volume, "\n")
	}
)

# Create tree_s4 objects for each row in dataset trees
cat("Dataset trees as S4 objects:\n")
apply(trees, 1, function(x) new("trees_s4", Girth=x[1], Height=x[2], Volume=x[3]))
