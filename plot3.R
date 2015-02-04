#Load data
source("load_data.R")

#As my Windows system is not english, i need to force the locale so the name of the days will be in english on the plot
Sys.setlocale("LC_ALL", "english")

#open png graphic device with size 480*480
png("plot3.png", width = 480, height = 480)

#Make Plot
plot(hpc_12Feb$Time, hpc_12Feb$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(hpc_12Feb$Time, hpc_12Feb$Sub_metering_2, col='red')
lines(hpc_12Feb$Time, hpc_12Feb$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

#close png graphic device
dev.off()