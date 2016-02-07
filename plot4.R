rm(list=ls())
setwd( "~/Documents/Workfiles/DataSci/JH/ExploratoryDataAnalysis/Week1-assignments")
require (lubridate)

#myurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#if (!file.exists("data")) 
#  dir.create("data")
#download.file(myurl, destfile="./data/household_power_consumption.zip", method="curl")
#unzip("data/household_power_consumption.zip", exdir="./data", overwrite = T)

data_tab <- read.table("./data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F)
data_tab$Date <- dmy(data_tab$Date)
data_tab$Time <- hms(data_tab$Time)
readings_tab <- subset (data_tab, Date %in% c(ymd("2007-02-01"), ymd("2007-02-02")))
readings_tab[3:9] <- lapply(readings_tab[3:9], as.numeric)

#4
png(file="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), bg="transparent")
#A
with( readings_tab, plot(Date+Time, Global_active_power, type="l", 
                         ylab="Global Active Power (kilowatts)",
                         xlab=""))

#B
with( readings_tab, plot(Date+Time, Voltage, type="l", 
                         ylab="Voltage",
                         xlab="datetime"))

#C
with( readings_tab, plot(Date+Time, Sub_metering_1,   type="l", ylab="Energy sub metering", xlab="", col="black"))
with ( readings_tab, lines(Date+Time, Sub_metering_2, col="red"))
with ( readings_tab, lines(Date+Time, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#D
with( readings_tab, plot(Date+Time, Global_reactive_power, type="l", 
                         #   ylab="Voltage",
                         xlab="datetime"))
dev.off()

