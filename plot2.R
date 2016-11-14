## load packages that are required for SQL statements in order to subset
## data during import

library(sqldf)

## import only records on 2007-02-01 and 2007-02-02
plotdata <- read.csv2.sql ("./household_power_consumption.txt", 
                           "select * from file where date='1/2/2007' or date='2/2/2007'")

## plot 2
DateTime <- strptime(paste(as.Date(plotdata$Date,"%d/%m/%Y"),plotdata$Time), 
                     format="%Y-%m-%d %H:%M:%S")
plotdata <- cbind(DateTime,plotdata)
png("./plot2.png", width=480, height=480)
with(plotdata,plot(DateTime, Global_active_power, type="l", xlab="",
                   ylab="Global Active Power (kilowatts)"))
dev.off()