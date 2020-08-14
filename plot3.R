## Loads the dataset
rawPower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## Filters the raw dataset by the required dates
datesPower <- rawPower[rawPower$Date == "1/2/2007" | rawPower$Date == "2/2/2007",]

##Removes the raw dataset
rm(rawPower)

## Adjusts variables classes
datesPower$Time <- as.POSIXct(paste(strptime(datesPower$Date,"%d/%m/%Y"), datesPower$Time))
datesPower$Date <- as.Date(strptime(datesPower$Date,"%d/%m/%Y"))
datesPower[,3:9] <- lapply(datesPower[,3:9], as.numeric)

## Plots the graph
plot(datesPower$Time, datesPower$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(datesPower$Time, datesPower$Sub_metering_1, type= "l")
points(datesPower$Time, datesPower$Sub_metering_2, type= "l", col = "red")
points(datesPower$Time, datesPower$Sub_metering_3, type= "l", col = "blue")
legend("topright", pch = 150, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saves the histogram as png
dev.copy(png, "plot3.png", units = "px", height = 480, width = 480)
dev.off()