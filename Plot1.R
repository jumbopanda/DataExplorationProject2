## Question #1

library(plyr)
library(ggplot2)

setwd("C:/Users/John/Documents/COURSERA/DataExploration")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge Data
data<- merge(NEI, SCC)

## Subset
data2<- subset(data,, select=c(year, Emissions))
## Aggregate
data3<-ddply(data2, .(year), numcolwise(sum))

## Plot Emissions by Year
png('plot1.png', width = 480, height = 480)
plot(data3$year, data3$Emissions/1000000, xlab="Year", ylab="Emissions (millions)", main="Emissions by year", type="b")
dev.off()
