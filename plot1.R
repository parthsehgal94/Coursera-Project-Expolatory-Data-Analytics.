x <- read.csv(hpc.txt,nrow=70000,sep=";")
newdate <- strptime(x$Date,"%e/%m/%Y")
x <- cbind(x,newdate)
y <- x[x$newdate >= "2007-02-01" & x$newdate <= "2007-02-02",]
y$Global_active_power<- as.numeric(as.character(y$Global_active_power))
with(y,hist(Global_active_power))
hist(y$Global_active_power,xlab = "Global Active Power(Killowatt)",main= "Globa Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()

