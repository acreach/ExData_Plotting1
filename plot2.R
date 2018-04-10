datahpc <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?" )

# Subsetting data on 01/02/2007 and 02/02/2007
dataset <- datahpc[ grep("^[1,2]/2/2007", datahpc$Date),]

# Converting Date to date format
dataset$Date <- strptime(paste(dataset$Date, dataset$Time, sep = " "),format="%d/%m/%Y %H:%M:%S")

# Just so you don't have French weekdays names displayed
Sys.setlocale("LC_TIME", "C")

jpeg('plot2.png', width = 480, height = 480)
plot(dataset$Date,dataset$Global_active_power,type="l", ylab = "Global Activer Power (kilowatts)", xlab = "",main = "" )
dev.off()