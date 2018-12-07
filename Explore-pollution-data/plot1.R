setwd("C:/Users/daala/Desktop/R course/Getting and Cleaning data")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dim(SCC)
head(SCC)
head(NEI)

table(NEI$Pollutant)

#get yearwise total of PM2.5 emissions
yearwise_total <- with(NEI, tapply(Emissions, year, sum, na.rm = T))

#getting all unique years
year <- unique(NEI$year)

#make a dataframe of the two variables made
d0 <- data.frame(year, yearwise_total)

png("plot1.png", width=480, height=480)
#make a plot out of it
plot(d0$year, d0$yearwise_total, pch = 20, xlab = "Year", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in the United States"))

dev.off()