source("read_power_data.R")

data = read_power_data()

png(file="plot3.png", width = 480, height = 480)

plot(data$Timestamp, data$Sub_metering_1, type="l",
     xlab = "", ylab="Energy sub metering")
points(data$Timestamp, data$Sub_metering_2, type="l",col="red")
points(data$Timestamp, data$Sub_metering_3, type="l",col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col =c("black", "red", "blue"),
       lty=c(1,1,1))

dev.off()