classes <- rep("character", times = 9)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = classes)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

subset <- data[data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"), ]
subset[,3:9] <- sapply(3:9, function(x) {as.numeric(subset[,x])})

GAPaxis <- c("Global Active Power (kilowatts)")
png(filename = "plot1.png")
hist(subset$Global_active_power, xlab = GAPaxis, main = "Global Active Power", col = "red")
dev.off()