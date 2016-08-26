# Code for reading data.
Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# Subset corresponding to the period 1/2/2007 to 2/2/2007.
Data <- subset(Data, Date == "1/2/2007" |Date == "2/2/2007")
# Convert variables to Date/Time format.
Data$DateTime <- strptime(with(Data, paste(Date, Time, sep = " ")), "%d/%m/%Y %H:%M:%S")

# Plot into the default Graphic Device
plot(Data$DateTime, Data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
# Copy the plot to the PNG device.
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()