## load table into R
table<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## subset table to required values 
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]
##changing data types
stripped <- strptime(paste(table2$Date, table2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(table2$Global_active_power)
subMetering1 <- as.numeric(table2$Sub_metering_1)
subMetering2 <- as.numeric(table2$Sub_metering_2)
subMetering3 <- as.numeric(table2$Sub_metering_3)
## plot and store 
png("plot3.png", width=450, height=450)
plot(stripped, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(stripped, subMetering2, type="l", col="red")
lines(stripped, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()