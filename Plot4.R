## load table into R
table<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## subset table to required values 
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]
## change data types 
stripped <- strptime(paste(table2$Date, table2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(table2$Global_active_power)
globalReactivePower <- as.numeric(table2$Global_reactive_power)
subMetering1 <- as.numeric(table2$Sub_metering_1)
subMetering2 <- as.numeric(table2$Sub_metering_2)
subMetering3 <- as.numeric(table2$Sub_metering_3)
voltage<-as.numeric(table2$Voltage)
##define file name
png("plot4.png", width=450, height=450)
##set number of graphs per row/coloumn
par(mfrow=c(2,2))
##plot graphs 
plot(stripped, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(stripped, voltage, type="l", xlab="stripped", ylab="Voltage")

plot(stripped, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(stripped, subMetering2, type="l", col="red")
lines(stripped, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(stripped, globalReactivePower, type="l", xlab="duration", ylab="Global_reactive_power")
dev.off()