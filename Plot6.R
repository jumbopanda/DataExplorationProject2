##  QUESTION #6

library(plyr)
library(ggplot2)

setwd("C:/Users/John/Documents/COURSERA/DataExploration")

## Modify data:
## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge Data
data<- merge(NEI, SCC)

data12 <- subset(data, data$fips %in% c("24510", "06037") & data$SCC.Level.One=="Mobile Sources", select=c("year", "fips", "Emissions", "SCC.Level.One"))

## summarize
data13<-ddply(data12, c("year", "fips", "SCC.Level.One"), numcolwise(sum))
## dont really need the facets here...
png('plot6.png', width = 480, height = 480)
ggplot(data13, aes(x=year, y=Emissions)) + geom_point(shape=1) + facet_grid(.~fips)
dev.off()