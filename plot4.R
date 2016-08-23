x <- read.csv("hpc.txt" , nrows = 70000 , header = TRUE, sep = ";")

x$Global_active_power <- as.numeric(x$Global_active_power)
x$Date <- as.Date(x$Date ,format="%d/%m/%Y" )
y <- x[(which(x$Date >= "2007-02-01" & x$Date <= "2007-02-02")),]
data.time  <- as.POSIXct(paste(y$Date,y$Time))
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)
y$Voltage <- as.numeric(y$Voltage)
y$Global_reactive_power <- as.numeric(y$Global_reactive_power)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(y, {
  plot(Global_active_power~data.time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~data.time, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~data.time, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~data.time,col='Red')
  lines(Sub_metering_3~data.time,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, bty="n", pt.cex = 1 ,cex = .60 ,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~data.time, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()



