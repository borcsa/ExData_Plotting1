#############################################
##    Author: Borbala Tasnadi
##
##    Exploratory Data Analysis
##    Assignment1 – Plot1
##############################################


## Set working directory -- CHANGE IT TO SOURCE DIRECTORY
setwd("/home/bori/Desktop/Coursera/04_EDA/Assignment1/ExData_Plotting1")

## Read in the whole table
powertab0 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
               colClasses = c(rep("character",2), rep("numeric", 7)))

## Filter table keeping rows with dates "1/2/2007" and "2/2/2007"
dates <- c("1/2/2007", "2/2/2007")
powertab <- powertab0[powertab0$Date %in% dates, ]

## Convert 'Date' and 'Time' into Date/Time format
powertab$Time <- strptime(paste(powertab$Date, powertab$Time, sep = ","), "%d/%m/%Y,%H:%M:%S")
## Eliminate 'Date' column.
powertab$Date <- NULL

## Open graphics device "png"
png("plot1.png")
## Create histogram
hist(powertab$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
## Close device
dev.off()
