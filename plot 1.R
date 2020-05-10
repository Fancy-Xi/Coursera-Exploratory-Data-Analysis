## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# compute the total emissions by year
ems_year <- aggregate(Emissions ~ year, NEI, sum)
color<- c("red", "yellow", "green", "blue")
p1 <- with(ems_year, 
           barplot(Emissions/1000 ~ year,  ylim=c(0,8000) , col=color,
                   xlab = "Year", ylab = expression ('PM'[2.5]*' in Kilotons'),
                   main = expression('Annual Emission PM' [2.5]*' from 1999 to 2008')))
# add numbers at top of bars
text(x=p1, y =round(ems_year$Emissions/1000,2), labels = round(ems_year$Emissions/1000,2),pos = 3, cex = 0.8)
dev.copy(png, file="plot1.png", width = 500, height = 500)
dev.off()