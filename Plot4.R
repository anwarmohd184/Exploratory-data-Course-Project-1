#Change Working Directory#
setwd("C:/Users/Admin/Desktop/data Scientist/Exploratory Data Analysis")
getwd()
#Load Data in R#
#Data Name household_power_consumption#
HPC<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#HPC
#dim(HPC)
#head(HPC)
#fix(HPC)#
#Subsetting the Data for 2007-02-01 and 2007-02-02#
# 

finalData <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

finalData <- cbind(SetTime, finalData)
#head(finalData)
#str(finalData)
#hist(finalData$Global_active_power)

#Plot 4#
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(finalData$SetTime, finalData$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, type="l", col="red")
lines(finalData$SetTime, finalData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finalData$SetTime, finalData$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")
