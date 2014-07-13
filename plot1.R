#Reading in Data and Cleaning
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data <-subset(data, data$Date == "2007-02-01"|data$Date == "2007-02-02")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(as.character(data$DateTime), "%Y-%m-%d %H:%M:%S")

#Creating Plot 1
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", breaks = 24, main = "Global Active Power",
     xlim = c(0,8), ylim=c(0,1200), axes=FALSE)
axis(1, at=c(0, 2, 4, 6), labels=c(0, 2, 4, 6))
axis(2, at=c(0, 200, 400, 600, 800, 1000, 1200), labels=c(0, 200, 400, 600, 800, 1000, 1200))

#Creating .PNG of Plot 1
dev.copy(png, file = "plot1.png", width = 480, height =480)
dev.off()
