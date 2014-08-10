classes <- rep("character", times = 9)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subset <- data[data$Date == (as.Date("2007-02-02") | as.Date("2007-02-01")), ]

subset$datetime <- as.POSIXct(paste(subset$Date, subset$Time), format = "%Y-%m-%d %H:%M:%S")

GAPaxis <- c("Global Active Power (kilowatts)")

png(filename = "plot2.png")
with(subset, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = GAPaxis))
dev.off()