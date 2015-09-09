library(lubridate)
library(stringr)
library(dplyr)

setwd("D:/jisnard/Documents/Coursera/courses/04_ExploratoryAnalysis")
Sys.setlocale("LC_TIME", "us")

data <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), sep= ";")

colnames(data) <- unlist(strsplit(readLines("household_power_consumption.txt", n=1), ";"))

data <-mutate(data, daytime = paste(data$Date, data$Time))

data$daytime <- dmy_hms(data$daytime)

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$daytime, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

