# Read the base file "household_power_consumption.txt" that contains the data
# Extract the filtered data according to the date range "2007-02-01" and "2007-02-02"
# Plot a "Global Active Power" Histogram

inputData <- "./data/household_power_consumption.txt"
powerData <- read.table(inputData, header = TRUE, stringsAsFactors = FALSE, sep = ";")
subData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
head(subData)

# Plot a Histogram and create a Graphic Device
globalActivePower <- as.numeric(subData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()