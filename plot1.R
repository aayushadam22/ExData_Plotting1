rawData <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F, na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)

colnames(rawData) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

hist(rawData$GlobalActivePower, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

dev.copy(png,file="plot1.png")
dev.off()