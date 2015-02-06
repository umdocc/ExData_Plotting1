data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y") #convert the date to the correct format

newData <- subset(data, (Date >=as.Date("2007-02-01") & Date <=as.Date("2007-02-02")))

newData$Global_active_power <- as.numeric(as.character(newData$Global_active_power)) #convert power to numeric

# open graphic device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white"
)

#creating the plot
hist(newData$Global_active_power, breaks = 12,
     freq = TRUE,
     include.lowest = TRUE, right = TRUE,
     density = NULL, angle = 45, col = "red", border = NULL,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency",
     axes = TRUE, plot = TRUE, labels = FALSE,
)


dev.off() #close device