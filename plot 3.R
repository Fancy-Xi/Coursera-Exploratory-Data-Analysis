## 3. Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bal <- filter(NEI, fips=="24510")
# aggregate baltimore data to get emission sum based on type and year
bal_type_year <- aggregate(Emissions~type+year, bal, sum)
# plot
ggplot(bal_type_year, aes(x=factor(year), y = Emissions, fill=type, label=round(Emissions,2))) +
    geom_bar(stat="identity")+
    facet_grid(.~type) + xlab("year") +
    ylab(expression("total PM"[2.5]*" emission in tons")) + 
    ggtitle(expression ("PM"[2.5]*paste(" emissions in Baltimore City by various source type"))) +
    geom_label(aes(fill=type), colour="white", fontface="bold")
dev.copy(png, file="plot3.png", width = 1000, height = 1000)
dev.off()