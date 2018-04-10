datahpc <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings = "?" )

# Subsetting data on 01/02/2007 and 02/02/2007
dataset <- datahpc[ grep("^[1,2]/2/2007", datahpc$Date),]

jpeg('plot1.png', width = 480, height = 480)
hist(dataset$Global_active_power,breaks=24, col="red",xlab = "Global Activer Power (kilowatts)", main = "Global Active Power")
dev.off()