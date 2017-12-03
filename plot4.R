memory_requirements_GB<-2075259*9*8/((2^20)*1000) 
library(lubridate)
library(tidyr)
library(ggplot2)
setwd("c:/users/camil/Desktop/DataScience/Analytics-Week1")
power_names<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
               "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
power<-read.table(file="household_power_consumption.txt", 
                  skip= 66637, nrow= 48*60+1,
                  sep=";", header=F, na.strings="?",
                  col.names=power_names)
power<-unite(power, DateTime, Date, Time, sep=" ")
power$DateTime<-dmy_hms(power$DateTime)
# Plot4
par(mfrow=c(2,2))
#plot 4.1
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#plot 4.2
with(power,plot(DateTime, Voltage, type="l", xlab="datetime"))
#plot 4.3
with(power, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", main=""))
lines(power$DateTime, power$Sub_metering_1, col="black", type="l")
lines(power$DateTime, power$Sub_metering_2, col="red", type="l")
lines(power$DateTime, power$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col=c("black","red","blue"), bty="n")
#plot 4.4
with(power,plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
# Create plot4.png
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#plot 4.1
plot(power$DateTime, power$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#plot 4.2
with(power,plot(DateTime, Voltage, type="l", xlab="datetime"))
#plot 4.3
with(power, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", main=""))
lines(power$DateTime, power$Sub_metering_1, col="black", type="l")
lines(power$DateTime, power$Sub_metering_2, col="red", type="l")
lines(power$DateTime, power$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, col=c("black","red","blue"), bty="n")
#plot 4.4
with(power,plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))
dev.off()
