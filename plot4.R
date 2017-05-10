# read dateset
dataset <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# add a date_time column newDate and transform all dates and times
cols <- c("Date", "Time")
dataset$newDate <- do.call(paste, c(dataset[cols], sep=" "))
dataset$Date <- as.Date(dataset$Date,  "%d/%m/%Y")
dataset$Time <- strptime(dataset$Time, "%H:%M:%S")
dataset$newDate <- strptime(dataset$newDate, "%d/%m/%Y %H:%M:%S")

# subset data to dates as given in assignment
dataset_subset <- subset(dataset, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

# open png file, set mfrow paramter and draw plot
png('plot4.png')
par(mfrow = c(2,2))
plot(dataset_subset$newDate, dataset_subset$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(dataset_subset$newDate, dataset_subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(dataset_subset$newDate, dataset_subset$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dataset_subset$newDate, dataset_subset$Sub_metering_2, col = "red")
lines(dataset_subset$newDate, dataset_subset$Sub_metering_3, col = "blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")

plot(dataset_subset$newDate, dataset_subset$Global_reactive_power, type = "l", ylab = "Global_reactive_power",xlab = "datetime")
dev.off()


