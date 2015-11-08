#############################################
##    Author: Borbala Tasnadi
##
##    Exploratory Data Analysis
##    Assignment1 – Plot3
##############################################


## Set working directory -- CHANGE IT TO SOURCE DIRECTORY
setwd("/home/bori/Desktop/Coursera/04_EDA/Assignment1/ExData_Plotting1")

## Read in the whole table
powertab0 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                        colClasses = c(rep("character",2), rep("numeric", 7)))

## Filter table keeping rows with dates "1/2/2007" and "2/2/2007"
dates <- c("1/2/2007", "2/2/2007")
powertab <- data.frame(powertab0[powertab0$Date %in% dates, ])

## Convert 'Date' and 'Time' into Date/Time format
powertab$Time <- strptime(paste(powertab$Date, powertab$Time, sep = ","), "%d/%m/%Y,%H:%M:%S")
## Eliminate 'Date' column.
powertab$Date <- NULL



## Create plot with graphics device "png"
png("plot3.png")
with(powertab, {plot(Time, Sub_metering_1, pch = ".", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_1)
      points(Time, Sub_metering_2, col = "red", pch = ".")
      lines(Time, Sub_metering_2, col = "red")
      points(Time, Sub_metering_3, col = "blue", pch = ".")
      lines(Time, Sub_metering_3, col = "blue")
      legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      })
dev.off()
