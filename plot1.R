data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880, 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", 
                                 "Sub_metering_2", "Sub_metering_3"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
time <- paste(data$Date, data$Time)
data$Time2 <- strptime(time, format = "%Y-%m-%d %T")
png(file = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     )
dev.off()
