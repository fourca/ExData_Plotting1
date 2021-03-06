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
# Plot1
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
# Create plot1.png
png("plot1.png", width=480, height=480, units="px")
hist(power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()