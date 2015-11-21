##  QUESTION #3

library(plyr)
library(ggplot2)

setwd("C:/Users/John/Documents/COURSERA/DataExploration")

NEI <- readRDS("summarySCC_PM25.rds")
## Reaggregate - -does this really only include fips=24510???
data6<-ddply(NEI[NEI$fips=="24510",], c("year", "type"), numcolwise(sum))

## Plot w Facets
png('plot3.png', width = 960, height = 480)
ggplot(data6, aes(x=year, y=Emissions)) + geom_point(shape=1) + facet_grid(.~type)
dev.off()