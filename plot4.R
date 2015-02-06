setwd("C:/Users/Cuong/Google Drive/Desktop/Data Science/Exploratory Data Analysis")
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #convert the date to the correct format

newData <- subset(data, (Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02")))

datetime<-as.POSIXct(paste(newData$Date, newData$Time), format="%Y-%m-%d %H:%M:%S")

newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power)) #convert power to numeric
newData$Global_reactive_power <- as.numeric(as.character(newData$Global_reactive_power)) #convert power to numeric
newData$Voltage <- as.numeric(as.character(newData$Voltage)) #convert to numeric
newData$Sub_metering_1 <- as.numeric(as.character(newData$Sub_metering_1)) #convert to numeric
newData$Sub_metering_2 <- as.numeric(as.character(newData$Sub_metering_2)) #convert to numeric
newData$Sub_metering_3 <- as.numeric(as.character(newData$Sub_metering_3)) #convert to numeric

#opening graphic device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white"
    )


#creating the plot
par(mfrow=c(2,2))

#plot 1
plot(datetime,newData$Global_active_power,type = "l",
     xlab="", ylab="Global Active Power")

# plot 2
plot(datetime,newData$Voltage,type = "l",
     xlab="datetime", ylab="Voltage")

# plot 3 
plot(datetime,newData$Sub_metering_1,type = "l", col = "black", 
     xlab="", ylab="Energy sub metering")
lines(datetime,newData$Sub_metering_2,col = "red")
lines(datetime,newData$Sub_metering_3,col = "blue")
legend("topright", lty = 1,bty="n", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       )

# plot 4
plot(datetime,newData$Global_reactive_power,type = "l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off() #close device