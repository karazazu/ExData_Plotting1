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


#1
png(file="plot1.png", width = 480, height = 480)
hist(readings_tab$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

