# Code for reading data.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset corresponding to the period 1/2/2007 to 2/2/2007.
Data <- subset(Data, Date == "1/2/2007" |Date == "2/2/2007")
# Convert variables to Date/Time format.
Data$DateTime <- strptime(with(Data, paste(Date, Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

# Open the PNG graphic device.
png("plot3.png", width = 480, height = 480)
# Plot into the device.
plot(Data$DateTime, Data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
points(Data$DateTime, Data$Sub_metering_2, type = "l", col = "red")
points(Data$DateTime, Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Close the device
dev.off()