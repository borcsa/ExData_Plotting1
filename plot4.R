#############################################
##    Author: Borbala Tasnadi
##
##    Exploratory Data Analysis
##    Assignment1 – Plot4
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



## Initialize plot to png file
png("plot4.png")

##set parameters
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(0, 1, 0, 0))

## Create plot1
with(powertab, {plot(Time, Global_active_power,  xlab = "", ylab = "Global Active Power (kilowatts)", 'n')
     lines(Time, Global_active_power)
     })

## Create plot2
with(powertab, {plot(Time, Voltage, xlab = "datetime", ylab = "Voltage", 'n')
      lines(Time, Voltage)
      })

## Create plot3
with(powertab, {plot(Time, Sub_metering_1, pch = ".", xlab = "", ylab = "Energy sub metering")
      lines(Time, Sub_metering_1)
      points(Time, Sub_metering_2, col = "red", pch = ".")
      lines(Time, Sub_metering_2, col = "red")
      points(Time, Sub_metering_3, col = "blue", pch = ".")
      lines(Time, Sub_metering_3, col = "blue")
      legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

## Create plot4
with(powertab, {plot(Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", 'n')
     lines(Time, Global_reactive_power)
     })

## Close device
dev.off()