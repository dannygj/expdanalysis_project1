#Reading in Data and Cleaning
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data <-subset(data, data$Date == "2007-02-01"|data$Date == "2007-02-02")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(as.character(data$DateTime), "%Y-%m-%d %H:%M:%S")

#Creating Plot 2
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
plot(data$DateTime, data$Global_active_power, type = "l")


?lines
#Creating .PNG of Plot 2
dev.copy(png, file = "plot2.png", width = 480, height =480)
dev.off()