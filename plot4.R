# Code for reading data.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset corresponding to the period 1/2/2007 to 2/2/2007.
Data <- subset(Data, Date == "1/2/2007" |Date == "2/2/2007")
# Convert variables to Date/Time format.
Data$DateTime <- strptime(with(Data, paste(Date, Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

# Open the PNG graphic device.
png("plot4.png", width = 480, height = 480)
# Set the structure of the grapichs.
par(mfrow = c(2,2))
# First plot.
plot(Data$DateTime, Data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = NA)
# Second plot.
plot(Data$DateTime, Data$Voltage, type = "l", xlab = "datetime", ylab = "Voltaje")
# Third plot.
plot(Data$DateTime, Data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
points(Data$DateTime, Data$Sub_metering_2, type = "l", col = "red")
points(Data$DateTime, Data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = c(1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Fourth plot.
plot(Data$DateTime, Data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
# Close the device.
dev.off()