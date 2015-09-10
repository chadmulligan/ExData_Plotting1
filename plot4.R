library(lubridate)
library(stringr)
library(dplyr)

setwd("D:/jisnard/Documents/Coursera/courses/04_ExploratoryAnalysis")
Sys.setlocale("LC_TIME", "us")

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep= ";")

colnames(data) <- unlist(strsplit(readLines("household_power_consumption.txt", n=1), ";"))

data <-mutate(data, datetime = paste(data$Date, data$Time))

data$datetime <- dmy_hms(data$datetime)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
  plot(datetime, Voltage, type = "l")  
  plot(Sub_metering_1 ~ datetime, type ="l", xlab="", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ datetime, col="red")
  lines(Sub_metering_3 ~ datetime, col="blue")
  legend("topright", bty = "n", lwd=1, col = c("black", "blue", "red"), legend = colnames(data[, 7:9]))
  plot(Global_reactive_power ~ datetime, type = "l")
    })
  
