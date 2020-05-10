## 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bal_mot <- filter(NEI, fips=="24510" & NEI$type=="ON-ROAD")
# aggregate bal_motor data to get emission sum based on year
bal_mot_year <- aggregate(Emissions~year, bal_mot, sum)
ggplot(bal_mot_year, aes(x=factor(year), y=Emissions, fill=year, label=round(Emissions,2))) +
    geom_bar(stat = "identity") +
    xlab ("year") +
    ylab (expression("total PM"[2.5]*" emissions in tons")) +
    ggtitle("Emissions from motor vehicle sources in Baltimore City")+
    geom_label(aes(fill = year),colour = "white", fontface = "bold")
dev.copy(png, file="plot5.png", width = 500, height = 500)
dev.off()