##  QUESTION #5

## Modify data:
## Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Merge Data
data<- merge(NEI, SCC)

data9 <- data[data$fips=="24510", c("year", "Emissions", "SCC.Level.One")]
data10 <- data9[grep("Mobile Sources", data9$SCC.Level.One),]
## summarize
data11<-ddply(data10, c("year", "SCC.Level.One"), numcolwise(sum))

## dont really need the facets here...
png('plot5.png', width = 480, height = 480)
ggplot(data11, aes(x=year, y=Emissions)) + geom_point(shape=1) + facet_grid(.~SCC.Level.One)
dev.off()