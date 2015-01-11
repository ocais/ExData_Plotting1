library(datasets)

# To run script - setwd() in same folder as "household_power_consumption.txt" file

# Load File
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,na.strings = c("?",""))

# Subset for 2007-02-01 and 2007-02-02
h.sub <- subset(h, h$Date == "1/2/2007" |  h$Date == "2/2/2007" )


DateTime <- paste(h.sub$Date, h.sub$Time)
DateTime2 <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
h.sub$Time <- DateTime2


#Create 4 Plots
par(mfrow=c(2,2))

# Plot 1,1 - Global Active Power 
plot(h.sub$Time,h.sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",col="Black")

# Plot 2,1 - Voltage
plot(h.sub$Time,h.sub$Voltage,type="l",xlab ="datetime", ylab="Voltage",col="Black")

# Plot 1,2 - Energy sub metering
plot(h.sub$Time,h.sub$Sub_metering_1,xlab="",type="l", ylab="Energy sub metering",col = "black")
lines(h.sub$Time,h.sub$Sub_metering_2, type="l", col="red")
lines(h.sub$Time,h.sub$Sub_metering_3, type="l", col="blue")

# Plot 1,2 - Legends without box
legend("topright",col=c("black","blue","red"),legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lwd=c(1, 1, 1),bty="n")

# Plot 2,2 - Global reactive power
plot(h.sub$Time,h.sub$Global_reactive_power,type="l",xlab ="datetime", ylab="Global_reactive_power",col="Black")


#Plot to a PNG file
# Issue with lengend on Windows with copy
png("Plot4.png",width=480, height=480)

#Create 4 Plots
par(mfrow=c(2,2))

# Plot 1,1 - Global Active Power 
plot(h.sub$Time,h.sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",col="Black")

# Plot 2,1 - Voltage
plot(h.sub$Time,h.sub$Voltage,type="l",xlab ="datetime", ylab="Voltage",col="Black")

# Plot 1,2 - Energy sub metering
plot(h.sub$Time,h.sub$Sub_metering_1,xlab="",type="l", ylab="Energy sub metering",col = "black")
lines(h.sub$Time,h.sub$Sub_metering_2, type="l", col="red")
lines(h.sub$Time,h.sub$Sub_metering_3, type="l", col="blue")

# Plot 1,2 - Legends without box
legend("topright",col=c("black","blue","red"),legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lwd=c(1, 1, 1),bty="n")

# Plot 2,2 - Global reactive power
plot(h.sub$Time,h.sub$Global_reactive_power,type="l",xlab ="datetime", ylab="Global_reactive_power",col="Black")

dev.off()