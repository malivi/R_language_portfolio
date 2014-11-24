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

# Create plot1.png

png(file = "plot1.png", width = 480, height = 480)
hist_data <- hist(data$Global_active_power)
plot(hist_data, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()