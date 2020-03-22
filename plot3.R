#plot3.R
data<-fread("./household_power_consumption.txt")
data_3 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(data_3$Date, data_3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
z<- as.numeric(data_3$Global_active_power)
subMetering_1 <- as.numeric(data_3$Sub_metering_1)
subMetering_2 <- as.numeric(data_3$Sub_metering_2)
subMetering_3 <- as.numeric(data_3$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering_2, type="l", col="red")
lines(datetime, subMetering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
