#url of the data file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#create data dir if doesn't exist yet
if (!file.exists("data")) {
  dir.create("data")
}

#download and unzip the data file if doesn't exist yet
if (!file.exists("./data/household_power_consumption.txt")) {
  
  download.file(fileUrl, destfile = "./data/household_power_consumption.zip")
  unzip("./data/household_power_consumption.zip", files="household_power_consumption.txt", exdir="data", overwrite=TRUE)
  
}

#read the household power consumption data file, missing values are ?
hpc <- read.table("./data/household_power_consumption.txt",
                  header=TRUE,
                  sep=';', 
                  na.strings='?', 
                  colClasses=c(rep('character', 2), rep('numeric', 7))
)

# substring the data to the day we need in February
hpc_12Feb <- hpc[(hpc$Date == "1/2/2007") | (hpc$Date == "2/2/2007"),]

# remove from the environment the complete data we don't need anymore to free memory
remove(hpc)

#convert the date and time field to the format we need
hpc_12Feb$Date <- as.Date(hpc_12Feb$Date , "%d/%m/%Y")
hpc_12Feb$Time <- paste(hpc_12Feb$Date, hpc_12Feb$Time, sep=" ")
hpc_12Feb$Time <- strptime(hpc_12Feb$Time, "%Y-%m-%d %H:%M:%S")



