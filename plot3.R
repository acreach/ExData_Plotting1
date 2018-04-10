datahpc <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?" )

# Subsetting data on 01/02/2007 and 02/02/2007
dataset <- datahpc[ grep("^[1,2]/2/2007", datahpc$Date),]

# Converting Date to date format
dataset$Date <- strptime(paste(dataset$Date, dataset$Time, sep = " "),format="%d/%m/%Y %H:%M:%S")

# Just so you don't have French weekdays names displayed
Sys.setlocale("LC_TIME", "C")

jpeg('plot3.png', width = 480, height = 480)
plot(dataset$Date,dataset$Sub_metering_1,type="l", ylab = "Energy sub metering", xlab = "" )
lines(dataset$Date,dataset$Sub_metering_2,type = 'l', col = "red")
lines(dataset$Date,dataset$Sub_metering_3,type = 'l', col= "blue")
legend("topright" , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black","red","blue"),lty=c(1,1,1))
dev.off()
