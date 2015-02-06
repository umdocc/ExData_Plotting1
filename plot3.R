data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #convert the date to the correct format

newData <- subset(data, (Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02")))

datetime<-as.POSIXct(paste(newData$Date, newData$Time), format="%Y-%m-%d %H:%M:%S")

newData$Sub_metering_1 <- as.numeric(as.character(newData$Sub_metering_1)) #convert to numeric
newData$Sub_metering_2 <- as.numeric(as.character(newData$Sub_metering_2)) #convert to numeric
newData$Sub_metering_3 <- as.numeric(as.character(newData$Sub_metering_3)) #convert to numeric

# open graphic device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white"
)

#creating the plot
plot(datetime,newData$Sub_metering_1,type = "l", col = "black", 
     xlab="", ylab="Energy sub metering")
lines(datetime,newData$Sub_metering_2,col = "red")
lines(datetime,newData$Sub_metering_3,col = "blue")
legend("topright", lty = 1,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       )

dev.off() #close device