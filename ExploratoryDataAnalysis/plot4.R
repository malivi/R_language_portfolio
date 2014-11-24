# Download and unzip data file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

# Read data from file only for dates 2007-02-01 and 2007-02-02.

# Reading basic information of data (vars and first line of obs)
datam <- read.csv("household_power_consumption.txt", sep = ";", nrow = 1)
# Calculation of number of lines to skip
lines_to_skip <- (as.numeric(strptime("1/2/2007 00:00:00", "%d/%m/%Y %H:%M:%S")) - as.numeric(strptime(paste(datam$Date, datam$Time), "%d/%m/%Y %H:%M:%S"))) / 60
# Reading data for specific time interval
data <- read.csv("household_power_consumption.txt", skip = lines_to_skip, nrow = 2880, sep = ";", na.strings = "?")
names(data) <- names(datam)
# Convertion of Date and Time variable to Date/Time classes
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create plot4.png

png(file = "plot4.png", width = 480, height = 480)
with(data, {
     par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
     plot(Date, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
     plot(Date, Voltage, xlab = "datetime", type = "l")
     plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
     points(Date, Sub_metering_2, col = "red", type = "l")
     points(Date, Sub_metering_3, col = "blue", type = "l")
     legend(x = "topright", lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), bty = "n")
     plot(Date, Global_reactive_power, xlab = "datetime", type = "l")
})
dev.off()