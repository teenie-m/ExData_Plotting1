classes <- rep("character", times = 9)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- data[data$Date == (as.Date("2007-02-02") | as.Date("2007-02-01")), ]

subset$datetime <- as.POSIXct(paste(subset$Date, subset$Time), format = "%Y-%m-%d %H:%M:%S")

GAPaxis <- c("Global Active Power (kilowatts)")

png(filename = "plot4.png")
par(mfrow=c(2, 2), pty = "s")

with(subset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = GAPaxis))

with(subset, plot(datetime, Voltage, type = "l"))

with(subset, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subset, lines(datetime, Sub_metering_2, col = "blue"))
with(subset, lines(datetime, subset$Sub_metering_3, col = "red"))
legendtxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", legend = legendtxt, lwd = "1", col = c("black", "blue", "red"), cex = 0.75, bty = "n")

with(subset, plot(datetime, Global_reactive_power, type = "l"))

dev.off()