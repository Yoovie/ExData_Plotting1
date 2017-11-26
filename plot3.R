#Load RPackage
library(datasets)
#load Data set
fulldata <- read.table("C:/Users/Yoov/Desktop/Coursera - Data Science/Expl data analysis - Week1 project/household_power_consumption.txt", header=T, sep=';', na.strings="?")
#Create subset
data <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
#Transform Date into date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
#Create Week day variable
datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
#Plot the data
with(data, {
  plot(Sub_metering_1~datetime, type="l", ylab = "Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
#Place legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Save image
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()