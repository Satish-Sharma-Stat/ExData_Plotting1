setwd("C:/Users/hp/desktop/coursera")
# plot1.R
data<-fread("./household_power_consumption.txt")
data_1<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data_1
x<-as.numeric(data_1$Global_active_power)
png("plot1.png",width=480,height = 480)
hist(x,col="red",main="Global Active Power",xlab = "Global Active Power(kilowatt)")

dev.off()
