# Exploratory Data Analysis plot1.R

read_power <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


read_power$Date <- as.Date(read_power$Date, format="%d/%m/%Y")
datetime <- paste(read_power$Date, read_power$Time)
read_power$Time <- as.POSIXct(datetime)
Data <- subset(read_power,Date >= "2007-02-01" & Date <= "2007-02-02")


#Creating hist plot
hist(Data$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#Saving files in png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()