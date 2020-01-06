install.packages("ggplot2")
library(ggplot2)

setwd("~/GitHub/ExData_Plotting1")
data = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
sub_data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot1
sub_data$Global_active_power = as.numeric(sub_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(sub_data$Global_active_power, col="red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

#plot2
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#plot3
png("plot3.png", width=480, height=480)
plot(datetime, sub_data$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(datetime, sub_data$Sub_metering_2, type="l", col="red")
lines(datetime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

#plot4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, sub_data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, sub_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sub_data$Sub_metering_1, type="l", ylab="Energy sub metering")
lines(datetime, sub_data$Sub_metering_2, type="l", col="red")
lines(datetime, sub_data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, sub_data$Global_active_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()


