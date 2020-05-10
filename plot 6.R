## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bal_mot <- filter(NEI, fips=="24510" & NEI$type=="ON-ROAD")
cal_mot <- filter(NEI, fips=="06037" & NEI$type=="ON-ROAD")
# aggregate bal_motor and cal_mot data to get emission sum based on year
bal_mot_year <- aggregate(Emissions~year, bal_mot, sum)
cal_mot_year <- aggregate(Emissions~year, cal_mot, sum)
# create a new variable called county
bal_mot_year$County <- "Baltimore City, MD"
cal_mot_year$County <- "Los Angeles County, CA"
# combine data from both counties
both <- rbind(bal_mot_year, cal_mot_year)
# draw plots
ggplot(both, aes(x=factor(year), y=Emissions, fill=County, label=round(Emissions,2))) +
    geom_bar(stat = "identity") +
    facet_grid(County~., scales = "free") +
    xlab ("year") +
    ylab (expression("total PM"[2.5]*" emissions in tons")) +
    ggtitle("Motor vehicle emission variation in Baltimore and Los Angeles in tons")+
    geom_label(aes(fill = County),colour = "white", fontface = "bold")
dev.copy(png, file="plot6.png", width = 550, height = 800)
dev.off()
