#plot4.R
data<-fread("./household_power_consumption.txt")
data_4<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(data_4$Date, data_4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
z_1<- as.numeric(data_4$Global_active_power)
z_2<- as.numeric(data_4$Global_reactive_power)
voltage <- as.numeric(data_4$Voltage)
subMetering1 <- as.numeric(data_4$Sub_metering_1)
subMetering2 <- as.numeric(data_4$Sub_metering_2)
subMetering3 <- as.numeric(data_4$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, z_1, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="Day")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, z_2, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
