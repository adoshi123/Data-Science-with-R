datafile <- "./Getting and cleaning data/household_power_consumption.txt"
data <- read.table(datafile,header = TRUE, sep=";", stringsAsFactors = FALSE, dec="." , na.strings = "?")
only_some_dates <- data[data$Date %in% c("1/2/2007","2/2/2017"), ]


#use strptime function to convert to datetime
datetime <- strptime(paste(only_some_dates$Date, only_some_dates$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(only_some_dates$Global_active_power)
datetime <- as.POSIXct(datetime)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()