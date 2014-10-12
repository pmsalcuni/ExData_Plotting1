data <- read.table("household_power_consumption.txt", sep = ";", 
                   na.strings = "?", skip = 66637, nrows = 2880, 
                   col.names = c("Date", "Time", "Global_active_power", 
                                 "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", 
                                 "Sub_metering_2", "Sub_metering_3"))
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
time <- paste(data$Date, data$Time)
data$Time2 <- strptime(time, format = "%Y-%m-%d %T")
png(file = "plot3.png")
plot(x = data$Time2, y = data$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(x = data$Time2, y = data$Sub_metering_2, col = "red")
lines(x = data$Time2, y = data$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                  "Sub_metering_3"), col = c("black", "red", 
                                                             "blue"), lwd = 1)
dev.off()