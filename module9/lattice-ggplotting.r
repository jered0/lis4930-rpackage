# Load required packages
install.packages("lattice")
install.packages("ggplot2")
library(lattice)
library(ggplot2)

# Read data from a CSV file selected by the user, leaving out the first column
# (its numbers are redundant with R's row numbering)
# Assuming it's using SeaSlug data from:
# https://vincentarelbundock.github.io/Rdatasets/csv/Stat2Data/SeaSlugs.csv
data_from_file <- read.table(file.choose(),header=T,sep=",")[,2:3]

# Plot the data with the built-in boxplot() function
boxplot((Percent*100)~Time,data_from_file, main="Sea Slug Metamorphose Rates", xlab="Time", ylab="Percent Metamorphosed", las=1, col=rainbow(6))

# Plot the data using the lattice package's bwplot() function
bwplot((Percent*100)~Time, data=data_from_file, horizontal=FALSE, main="Sea Slug Metamorphose Rates", xlab="Time", ylab="Percent Metamorphosed", las=1, par.settings = list(box.rectangle = list(fill=rainbow(6))))

# Plot the data using ggplot2

# First create a separate list so the Time data can be converted to factors
data_for_gg <- data_from_file
data_for_gg$Time <- as.factor(data_for_gg$Time)

# Plot the data as a geom_boxplot()
ggplot(data_for_gg, aes(x=Time, y=Percent*100, fill=Time)) + geom_boxplot() + labs(title="Sea Slug Metamorphose Rates", x="Time", y="Percent Metamorphosed") + theme_classic()
