library(datasets)

# To run script - setwd() in same folder as "household_power_consumption.txt" file

# Load File
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,na.strings = c("?",""))

# Subset for 2007-02-01 and 2007-02-02
h.sub <- subset(h, h$Date == "1/2/2007" |  h$Date == "2/2/2007" )


DateTime <- paste(h.sub$Date, h.sub$Time)
DateTime2 <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
h.sub$Time <- DateTime2


#Plot to a PNG file
png("Plot3.png",width=480, height=480)

# Plot lines
plot(h.sub$Time,h.sub$Sub_metering_1,xlab="",type="l", ylab="Energy sub metering",col = "black")
lines(h.sub$Time,h.sub$Sub_metering_2, type="l", col="red")
lines(h.sub$Time,h.sub$Sub_metering_3, type="l", col="blue")

# Legends
legend("topright",col=c("black","blue","red"),legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "),lwd=c(1, 1, 1))


dev.off()


