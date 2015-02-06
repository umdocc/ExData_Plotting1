data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #convert the date to the correct format

newData <- subset(data, (Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02")))

datetime<-as.POSIXct(paste(newData$Date, newData$Time), format="%Y-%m-%d %H:%M:%S") #create datetime vector

newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power)) #convert power to numeric

# open graphic device
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white"
)

#creating the plot
plot(datetime,newData$Global_active_power,type = "l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off() #close device