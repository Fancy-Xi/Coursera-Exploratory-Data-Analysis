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

#plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(testdata, {
    plot(Global_active_power ~ Datetime, type="l",
         ylab = "Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l",
         ylab = "Voltage", xlab = "datetime")
    plot(Sub_metering_1 ~ Datetime, type="l",
         ylab = "Energy sub metering", xlab ="")
    lines(Sub_metering_2 ~ Datetime, type= "l", col= "red")
    lines(Sub_metering_3 ~ Datetime, type= "l", col= "blue")
    legend("topright", col = c("black", "red", "blue"),bty ="n",
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=1, lwd=2,cex=0.6, y.intersp=0.3)
    plot(Global_reactive_power ~ Datetime, type= "l",
         ylab = "Global Reactive Power", xlab ="datetime")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()