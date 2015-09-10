library(lubridate)
library(stringr)
library(dplyr)

setwd("D:/jisnard/Documents/Coursera/courses/04_ExploratoryAnalysis")
Sys.setlocale("LC_TIME", "us")

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep= ";")

colnames(data) <- unlist(strsplit(readLines("household_power_consumption.txt", n=1), ";"))

data <-mutate(data, daytime = paste(data$Date, data$Time))

data$daytime <- dmy_hms(data$daytime)

png("plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1 ~ data$daytime, type ="l", xlab="", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$daytime, col="red")
lines(data$Sub_metering_3 ~ data$daytime, col="blue")
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = colnames(data[, 7:9]))
