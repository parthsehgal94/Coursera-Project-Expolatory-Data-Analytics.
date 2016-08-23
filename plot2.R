x <- read.csv(hpc.txt,nrow=70000,sep=";")
newdate <- strptime(x$Date,"%e/%m/%Y")
x <- cbind(x,newdate)
y <- x[x$newdate >= "2007-02-01" & x$newdate <= "2007-02-02",]
y$Global_active_power<- as.numeric(as.character(y$Global_active_power))


with(y,plot(Global_active_power,type="s",xaxt = "n",ylab="Global Active Power"))
axis(1,at=c(0,1500,2900),labels= c("Thu","Fri", "Sat"))


dev.copy(png,file="plot2.png")
dev.off()

