## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bal <- filter(NEI, fips=="24510")
# aggregate baltimore data to get emission sum based on year
bal_ems_year <- aggregate(Emissions ~ year, bal, sum)
color<- c("red", "yellow", "green", "blue")
p2 <- with(bal_ems_year, 
           barplot(Emissions/1000 ~ year, col=color, ylim = c(0,4),
                   xlab = "Year", ylab = expression ('PM'[2.5]*' in Kilotons'),
                   main = expression('Annual Emission PM' [2.5]*' in Baltimore city, MD from 1999 to 2008')))
# add numbers at top of bars
text(x=p2, y =round(bal_ems_year$Emissions/1000,2), labels = round(bal_ems_year$Emissions/1000,2),pos = 3, cex = 0.8)
dev.copy(png, file="plot2.png", width = 500, height = 500)
dev.off()
