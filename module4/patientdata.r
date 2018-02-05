# Load patient data into vectors for readability
Patient.1 <- c("0.6","103","bad","low","low")
Patient.2 <- c("0.3","87","bad","low","high")
Patient.3 <- c("0.4","32","bad","high","low")
Patient.4 <- c("0.4","42","bad","high","high")
Patient.5 <- c("0.2","59","good","low","low")
Patient.6 <- c("0.6","109","good","low","high")
Patient.7 <- c("0.3","78","good","high","low")
Patient.8 <- c("0.4","205","good","high","high")
Patient.9 <- c("0.9","135","NA","high","high")
Patient.10 <- c("0.2","176","bad","high","high")

# Collect patient data into a data frame to make it easier to collect
patients <- data.frame(Patient.1,Patient.2,Patient.3,Patient.4,Patient.5,
	Patient.6,Patient.7,Patient.8,Patient.9,Patient.10)

# Create vectors for each value to be graphed
# (Factors were giving poor precision when converting to numbers, so
# some vectors were converted to characters first)
frequency <- sapply(sapply(patients[1,],as.character),as.numeric)
bp <- sapply(sapply(patients[2,],as.character),as.numeric)
first <- ifelse(patients[3,] == "bad",1,ifelse(patients[3,] == "good",0,NA))[1,]
second <- ifelse(patients[4,] == "high",1,ifelse(patients[4,] == "low",0,NA))[1,]
final <- ifelse(patients[5,] == "high",1,ifelse(patients[5,] == "low",0,NA))[1,]

# Make a matrix from the extracted numeric values
patients.num <- matrix(c(frequency,bp,first,second,final),ncol=10,byrow=T)
colnames(patients.num) <- colnames(patients)
rownames(patients.num) <- c("Frequency", "BP", "First", "Second", "Final")

# Create a boxplot showing averages of doctor opinions
boxplot(patients.num[3:4,], main="Doctor Opinions vs. ER Priority", ylab="Assessments", yaxt='n', las=2, col="gray")
axis(2,labels=c("Good","Bad"), at=0:1, las=1)

# Add points showing ER priority for each patient
points(patients.num[5,], col="red", pch=19)

# Add a plot for patient blood pressure
par(new=T)
plot(patients.num[2,], axes=F, col="blue", pch=17, xlab="", ylab="")
axis(4)
mtext("Blood Pressure", 4)

# Add a legend
legend("bottomright", legend=c("Doctor Av.", "ER Priority", "Blood Pressure"), col=c("black", "red", "blue"), fill=c("black", "red", "blue"), cex=0.75)

# New window (on Windows - change to quartz() for Mac)
windows()

# Make a histogram for visit frequency
hist(patients.num[1,], col="gray", main="Patient Visit Frequency", xlab="Visit Frequency in Past Twelve Months", ylab="Patients")