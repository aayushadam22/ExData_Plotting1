rawData <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F, na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)

colnames(rawData) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format = '%d/%m/%Y %H:%M:%S')

plot(x = rawData$DateTime, y = rawData$GlobalActivePower, 
     type = 'l', xlab = NA, ylab = 'Global Active Power (kilowatts)')

dev.copy(png,file="plot2.png")
dev.off()