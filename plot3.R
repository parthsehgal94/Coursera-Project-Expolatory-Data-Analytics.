x <- read.csv(hpc.txt,nrow=70000,sep=";")
newdate <- strptime(x$Date,"%e/%m/%Y")
x <- cbind(x,newdate)
y <- x[x$newdate >= "2007-02-01" & x$newdate <= "2007-02-02",]
y$Global_active_power<- as.numeric(as.character(y$Global_active_power))
y$Sub_metering_1<- as.numeric(as.character(y$Sub_metering_1))
y$Sub_metering_2<- as.numeric(as.character(y$Sub_metering_2))
y$Sub_metering_3<- as.numeric(as.character(y$Sub_metering_3))


with(y,plot(Sub_metering_1,type="s",xaxt = "n",ylab="Energy Sub metering",xlab=''))
lines(y$Sub_metering_2,col="red")
lines(y$Sub_metering_3,col="blue")
axis(1,at=c(0,1500,2900),labels= c("Thu","Fri", "Sat"))

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),fill = c("black","red","blue"))


dev.copy(png,file="plot3.png")
dev.off()

