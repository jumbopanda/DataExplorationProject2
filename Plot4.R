## Merge Data

library(plyr)
library(ggplot2)

setwd("C:/Users/John/Documents/COURSERA/DataExploration")

## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data<- merge(NEI, SCC)

## get Coal Combustion:
data7 <- data[grep("coal", data$Short.Name), c("year", "Emissions")]
## summarize
data8<-ddply(data7, c("year"), numcolwise(sum))
## dont really need the facets here...

png('plot4.png', width = 480, height = 480)
ggplot(data8, aes(x=year, y=Emissions)) + geom_point(shape=1) 
dev.off()