library(lubridate)
library(stringr)
setwd("D:/jisnard/Documents/Coursera/courses/04_ExploratoryAnalysis")

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep= ";")

colnames(data) <- unlist(strsplit(readLines("household_power_consumption.txt", n=1), ";"))

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

max <- max(data$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, freq = T, breaks = seq(0,max+0.5, by=0.5), col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")


