## load table into R
table<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## subset table to required values 
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]
## change date type
stripped <- strptime(paste(table2$Date, table2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##convert to numeric 
globalActivePower <- as.numeric(table2$Global_active_power)
## open png device ,plot and close
png("plot2.png", width=450, height=450)
plot(stripped, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()