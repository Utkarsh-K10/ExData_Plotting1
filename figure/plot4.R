#reading the data
data<-read.table("House_Hold_pow_consmp.txt",header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))
head(data)
names(data)

#converting first Date and Time in singl ecolumn
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data)

#removing Date and Timme column
data$Date<- NULL
data$Time<- NULL
head(data)

#taking data from 2007-02-02 to 2007-02-02
data1 <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime<= as.POSIXct("2007-02-02 23:59:00"))

#now plotting and saving plot3

png(filename = "plot4.png", width = 480,  height = 480, units = "px")

#setting margin

par(mfrow = c(2,2), mar = c(4,4,2,1))

#first
plot(data1$DateTime, as.numeric(data1$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#second
plot(data1$DateTime, data1$Voltage, type = "l", xlab="date time", ylab = "voltage")

#third
plot(data1$DateTime, data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data1$DateTime, data1$Sub_metering_2, type = "l", col="red")
points(data1$DateTime, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1, y.intersp = 1)

#fourth
plot(data1$DateTime, data1$Global_reactive_power, type = "l", xlab = "date time", ylab = "Global Reactive Power (kilowatts)")

dev.off()
