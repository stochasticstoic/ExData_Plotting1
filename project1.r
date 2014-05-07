setwd("C:/Users/dimitri/workspaces/courses/coursera_exploratory")

power = 
    read.table("household_power_consumption.txt", 
               header=T, sep=";",na.strings="?",
               stringsAsFactors=F)

power$Date <- as.Date(power$Date,format="%d/%m/%Y")

data = power[power$Date>='2007/02/01' & 
                 power$Date <='2007/02/02',]

data$Timestamp=
    format(as.POSIXct(paste(data$Date, data$Time)), "%d/%m/%Y %H:%M:%S") 

data$Timestamp <- strptime(data$Timestamp,"%d/%m/%Y %H:%M:%S")


hist(data$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

plot(data$Timestamp, data$Global_active_power, type="l",
     xlab = "", ylab="Global Active Power (kilowatts)")


plot(data$Timestamp, data$Sub_metering_1, type="l",
     xlab = "", ylab="Energy sub metering")
points(data$Timestamp, data$Sub_metering_2, type="l",col="red")
points(data$Timestamp, data$Sub_metering_3, type="l",col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col =c("black", "red", "blue"),
       lty=c(1,1,1))

par(mfrow=c(2,2))

plot(data$Timestamp, data$Global_active_power, type="l",
     xlab = "", ylab="Global Active Power")

plot(data$Timestamp, data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

plot(data$Timestamp, data$Sub_metering_1, type="l",
     xlab = "", ylab="Energy sub metering")
points(data$Timestamp, data$Sub_metering_2, type="l",col="red")
points(data$Timestamp, data$Sub_metering_3, type="l",col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col =c("black", "red", "blue"),
       lty=c(1,1,1), bty="n")

plot(data$Timestamp, data$Global_reactive_power, type="l", 
        xlab="datetime", ylab="Global_reactive_power")


