## load packages that are required for SQL statements in order to subset
## data during import

library(sqldf)

## import only records on 2007-02-01 and 2007-02-02
plotdata <- read.csv2.sql ("./household_power_consumption.txt", 
                           "select * from file where date='1/2/2007' or date='2/2/2007'")

## plot 1
png("./plot1.png", width = 480, height = 480, units = "px")
hist(plotdata$Global_active_power, main ="Global Active Power", xlab = "Global Active Power (kiowatts)", col = 'Red')
dev.off()