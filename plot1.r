library(datasets)

# To run script - setwd() in same folder as "household_power_consumption.txt" file

# Load File
h = read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE,na.strings = c("?",""))

# Subset for 2007-02-01 and 2007-02-02
h.sub <- subset(h, h$Date == "1/2/2007" |  h$Date == "2/2/2007" )

#Plot to a PNG file
png("Plot1.png",width=480, height=480)

# Histogram
hist(h.sub$Global_active_power,col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency")


dev.off()