## 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#coal <- SCC[grep("[Cc]oal", SCC$EI.Sector), "SCC"]
coal1 <- grepl("Coal", SCC$EI.Sector)
coal_source <- SCC[coal1,]
# select emissions from coal-related sources
c_em <- NEI[(NEI$SCC %in% coal_source$SCC),]
# aggregate coal emission data to get emission sum based on year
c_em_year <- aggregate(Emissions~year, c_em, sum)
ggplot(c_em_year, aes(x=factor(year), y= Emissions/1000, fill=year, label=round(Emissions/1000,2))) +
    geom_bar(stat="identity") +
    xlab("year") +
    ylab("Emissions from coal combustion-related sources in kilotons") +
    geom_label(aes(fill=year),colour ="white", fontface="bold")
dev.copy(png, file="plot4.png", width = 500, height = 500)
dev.off()