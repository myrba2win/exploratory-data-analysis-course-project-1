# Read the base file "household_power_consumption.txt" that contains the data
# Extract the filtered data according to the date range "2007-02-01" and "2007-02-02"
# Plot a "Global Active Power" Histogram

inputData <- "./data/household_power_consumption.txt"
powerData <- read.table(inputData, header = TRUE, stringsAsFactors = FALSE, sep = ";")
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
head(subData)

# Filtering and segmenting the data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

# Plot a Histogram and create a Graphic Device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# Plot first Graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot second Graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot third Graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot fourth Graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# closing the graphic device
dev.off()