# Exploratory Data Analysis plot2.R

read_power <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


read_power$Date <- as.Date(read_power$Date, format="%d/%m/%Y")
datetime <- paste(read_power$Date, read_power$Time)
read_power$Time <- as.POSIXct(datetime)
Data <- subset(read_power,Date >= "2007-02-01" & Date <= "2007-02-02")


plot(Data$Global_active_power~Data$Time,type="l",ylab="GlobalActive Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()