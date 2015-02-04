#Load data
source("load_data.R")

#As my Windows system is not english, i need to force the locale so the name of the days will be in english on the plot
Sys.setlocale("LC_ALL", "english")

#open png graphic device with size 480*480
png("plot2.png", width = 480, height = 480)

#Make Plot
plot(hpc_12Feb$Time, hpc_12Feb$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#close png graphic device
dev.off()