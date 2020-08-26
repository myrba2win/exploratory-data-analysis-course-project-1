# Read the base file "household_power_consumption.txt" that contains the data
# Extract the filtered data according to the date range "2007-02-01" and "2007-02-02"
# Plot a "Global Active Power" Histogram

inputData <- "./data/household_power_consumption.txt"
powerData <- read.table(inputData, header = TRUE, stringsAsFactors = FALSE, sep = ";")
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
head(subData)

# Get weekdays in English
dev_null <- Sys.setlocale("LC_TIME", "english")

# Filtering and segmenting the data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

# Plot a Histogram and create a Graphic Device
png("plot3.png", width=480, height=480)

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# closing the graphic device
dev.off()