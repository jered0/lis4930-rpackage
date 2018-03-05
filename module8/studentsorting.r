# Load required package
install.packages("plyr")
library(plyr)

# Read student data from a CSV file selected by the user
students <- read.table(file.choose(),header=T,sep=",")

# Create an altered list sorted on sex, with separate Grade means per gender
students_gendered_mean <- ddply(students, "Sex", transform, average_grade=mean(Grade))

# Write the new data set to a file
write.table(students_gendered_mean, "Students_Gendered_Mean")

# Filter the original data set to include only data for which the student name
# contained the letter i.
i_students <- subset(students, grepl("i", students$Name, ignore.case=T))

# Write the filtered data set to a CSV file
write.table(i_students, "DataSet_Subset.csv", sep=",")
