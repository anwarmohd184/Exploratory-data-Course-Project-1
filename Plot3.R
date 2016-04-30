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
#Plot 3#
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(finalData$SetTime, finalData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(finalData$SetTime, finalData$Sub_metering_2, col=columnlines[2])
lines(finalData$SetTime, finalData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")