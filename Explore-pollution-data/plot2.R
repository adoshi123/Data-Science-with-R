setwd("C:/Users/daala/Desktop/R course/Getting and Cleaning data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

only_baltimore  <- subset(NEI, fips == "24510")

#get yearwise total of PM2.5 emissions
yearwise_total <- with(only_baltimore, tapply(Emissions, year, sum, na.rm = T))

#getting all unique years
year <- unique(only_baltimore$year)

#make a dataframe of the two variables made
d0 <- data.frame(year, yearwise_total)

png("plot2.png", width=480, height=480)
#make a plot out of it
par(mfrow = c(1, 1), mar = c(4, 4, 4, 4))
plot(d0$year, d0$yearwise_total, pch = 20, xlab = "Year", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in Baltimore City, Maryland"))

dev.off()
