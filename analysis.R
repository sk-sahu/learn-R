# check current working directory
getwd()

# chnage working direcory
setwd(".")

# check if data file is present
file.exists("patient-info.txt")

# read the data into R
data <- read.table("~/Desktop/patient-info.txt", header = T, sep = "\t")

# Explore the data
head(data)
paste("Number of patients", nrow(data))
paste("Number of atributes", ncol(data))
paste("Attributes are")
names(data)

# check if missing data is there with NA
all(is.na(data))

mean(data$Height, na.rm = T)

# calculate BMI
BMI <- (data$Weight)/((data$Height/100)^2)
BMI

# calculate upper limit for BMI
upper.limit <- mean(BMI,na.rm = TRUE) + 2*sd(BMI,na.rm = TRUE)
upper.limit

# BMI plot
plot(BMI)
abline(h=upper.limit)
abline(h = 22)

# add BMI to the data 
data_2 <- cbind(data, BMI)
write.csv(data_2, "~/Desktop/with_BMI.csv")
