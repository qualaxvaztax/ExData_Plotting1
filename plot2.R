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
plot(datesPower$Time, datesPower$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Saves the histogram as png
dev.copy(png, "plot2.png", units = "px", height = 480, width = 480)
dev.off()