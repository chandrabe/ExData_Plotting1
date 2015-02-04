#Load data
source("load_data.R")

#open png graphic device with size 480*480
png("plot1.png", width = 480, height = 480)

#Make Plot
hist(hpc_12Feb$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)")

#close png graphic device
dev.off()