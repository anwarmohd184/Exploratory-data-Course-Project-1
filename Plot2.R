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
#plot2
plot(finalData$SetTime, finalData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")
