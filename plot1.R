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

# open png file, reset mfrow paramter and draw plot
png('plot1.png')
par(mfrow = c(1,1))
hist(dataset_subset$Global_active_power, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main= "Global Active Power", col ="Red")
dev.off()