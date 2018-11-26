
datafile <- "./Getting and cleaning data/household_power_consumption.txt"
data <- read.table(datafile,header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")
only_some_dates <- data[data$Date %in% c("1/2/2007","2/2/2017"), ]

globalActivePower <- as.numeric(only_some_dates$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col= "red", xlab = "Global Active Power(kilowatts")
dev.off()