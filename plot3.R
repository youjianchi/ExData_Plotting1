## load packages that are required for SQL statements in order to subset
## data during import

library(sqldf)

## import only records on 2007-02-01 and 2007-02-02
plotdata <- read.csv2.sql ("./household_power_consumption.txt", 
                           "select * from file where date='1/2/2007' or date='2/2/2007'")

## plot 3
png("./plot3.png", width=480, height=480)
with(plotdata,plot(DateTime, Sub_metering_1, type="l", xlab="",
                   ylab="Energy sub metering"))
with(plotdata, points(DateTime, Sub_metering_2, type="l", col="red"))
with(plotdata, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1,col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()