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

#now plotting and saving plot2
png(filename = "plot2.png", width = 480,  height = 480, units = "px")

plot(data1$DateTime, as.numeric(data1$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
