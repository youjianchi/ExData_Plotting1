## load packages that are required for SQL statements in order to subset
## data during import

library(sqldf)

## import only records on 2007-02-01 and 2007-02-02
plotdata <- read.csv2.sql ("./household_power_consumption.txt", 
                           "select * from file where date='1/2/2007' or date='2/2/2007'")

## plot 4
png("./plot4.png",width=480, height=480)
par(mfcol = c(2,2))
with(plotdata,plot(DateTime, Global_active_power, type="l", xlab="",
                   ylab="Global Active Power (kilowatts)"))
with(plotdata,plot(DateTime, Sub_metering_1, type="l", xlab="",
                   ylab="Energy sub metering"))
with(plotdata, points(DateTime, Sub_metering_2, type="l", col="red"))
with(plotdata, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, bty='n', col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(plotdata,plot(DateTime, Voltage, type="l", xlab="datetime",ylab="Voltage"))
with(plotdata,plot(DateTime, Global_reactive_power, type="l", xlab="datetime",ylab="Golbal_reactive_power"))
dev.off()



