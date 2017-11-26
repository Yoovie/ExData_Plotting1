#Load RPackage
library(datasets)
#load Data set
fulldata <- read.table("C:/Users/Yoov/Desktop/Coursera - Data Science/Expl data analysis - Week1 project/household_power_consumption.txt", header=T, sep=';', na.strings="?")
#Create subset
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
#Transform Date into date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Create histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Create PNG file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()