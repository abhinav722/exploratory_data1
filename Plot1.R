## load table into R
table<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
## subset table to required values 
table2 <- table[table$Date %in% c("1/2/2007","2/2/2007") ,]
## plot hist function 
hist(table2$Global_active_power,col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
## copy to png file 
dev.copy(png,file="Plot1.png")
## close device 
dev.off