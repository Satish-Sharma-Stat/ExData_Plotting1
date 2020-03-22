#  plot2.R
data<-fread("./household_power_consumption.txt")
data_2 <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
data_2

datetime <- strptime(paste(data_2$Date,data_2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
datetime
y<- as.numeric(data_2$Global_active_power)
y
png("plot2.png", width=480, height=480)
plot(datetime,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
