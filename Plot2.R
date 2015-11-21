##  QUESTION #2

library(plyr)
library(ggplot2)

setwd("C:/Users/John/Documents/COURSERA/DataExploration")

## Modify data:
NEI <- readRDS("summarySCC_PM25.rds")
data4 <- NEI[NEI$fips=="24510", c("year", "Emissions")]
data5<-ddply(data4, .(year), numcolwise(sum))

## Plot Emissions by Year
png('plot2.png', width = 480, height = 480)
plot(data5$year, data5$Emissions, xlab="Year", ylab="Emissions (millions)", main="Emissions by year", type="b")
dev.off()