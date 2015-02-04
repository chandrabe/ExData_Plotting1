#Load data
source("load_data.R")

#As my Windows system is not english, i need to force the locale so the name of the days will be in english on the plot
Sys.setlocale("LC_ALL", "english")

#open png graphic device with size 480*480
png("plot4.png", width = 480, height = 480)

#Segment graphic device in 2 rows and 2 columns
par(mfrow=c(2,2))

#Make Plot row 1 col 1
plot(hpc_12Feb$Time, hpc_12Feb$Global_active_power, ylab='Global Active Power', xlab='', type='l')

#Make Plot row1 col 2
plot(hpc_12Feb$Time, hpc_12Feb$Voltage, xlab='datetime', ylab='Voltage', type='l')

#Make Plot row 2 col 1
plot(hpc_12Feb$Time, hpc_12Feb$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(hpc_12Feb$Time, hpc_12Feb$Sub_metering_2, col='red')
lines(hpc_12Feb$Time, hpc_12Feb$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

#Make Plot row 2 col 2
plot(hpc_12Feb$Time, hpc_12Feb$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')

#close png graphic device
dev.off()