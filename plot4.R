rawData <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F, na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)

colnames(rawData) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time), format = '%d/%m/%Y %H:%M:%S')

par(mfrow = c(2, 2)) 

plot(x = rawData$DateTime, y = rawData$GlobalActivePower, type = 'l', xlab = NA, ylab = 'Global Active Power')

plot(x = rawData$DateTime, y = rawData$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(x = rawData$DateTime, y = rawData$SubMetering1, type = 'l',xlab = NA, ylab = 'Energy sub metering')
lines(x = rawData$DateTime, y = rawData$SubMetering2, col = 'red')
lines(x = rawData$DateTime, y = rawData$SubMetering3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col = c('black', 'red', 'blue'),lwd = 1, bty = 'n')

plot(x = rawData$DateTime, y = rawData$GlobalReactivePower, type = 'l',xlab = 'datetime', ylab = 'Global_reactive_power')

dev.copy(png,file="plot4.png")
dev.off()