setwd("C:/Users/daala/Desktop/R course/Getting and Cleaning data")
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
coal_sources <- SCC[coal,]

png("plot4.png", width = 480, height = 480)
# Find emissions from coal combustion-related sources
combustion <- NEI[(NEI$SCC %in% coal_sources$SCC), ]
require(dplyr)
emissions.coal.related <- summarise(group_by(combustion, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  # facet_grid(. ~ year) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")
dev.off()