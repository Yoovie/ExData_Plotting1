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
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#Create PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()