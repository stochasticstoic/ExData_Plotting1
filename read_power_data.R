read_power_data <- function() {
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
    return(data)
}