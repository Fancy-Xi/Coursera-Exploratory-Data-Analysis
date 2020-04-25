## This is plot2 generated from 'Electric power consumption' dataset for course project1

#Read data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
#Convert date  
data$Date <- as.Date(data$Date, format= "%d/%m/%Y")
#Subset data from 2007/1/2 to 2007/2/2 and convert time 
testdata <- data[data$Date >= "2007-2-1" & data$Date <= "2007-2-2",]
#Combine date and time
datetime <- paste(as.Date(testdata$Date), testdata$Time)
testdata$Datetime <- as.POSIXct(datetime)
#Convert other columns to numeric
testdata[,3:9] = apply(testdata[,3:9],2,as.numeric)

#Plot2
with(testdata, {
    plot(Global_active_power ~ Datetime, type="l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
})
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()