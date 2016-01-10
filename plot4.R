dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#cleandata
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#carve values to plot
globalActivePower <- as.numeric(subSetData$Global_active_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#subplot(1,1)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#subplot(1,2)
plot(datetime, voltage, type="l", xlab="", ylab="Voltage")

#subplot(2,1)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub meeting")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col=c("black", "red", "blue"))

#subplot(2,2)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()