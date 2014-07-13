/#Reading in Data and Cleaning
data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")
data <-subset(data, data$Date == "2007-02-01"|data$Date == "2007-02-02")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(as.character(data$DateTime), "%Y-%m-%d %H:%M:%S")

#Cleaning Variables to be used
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

#Creating Plot
par(mfrow = c(2, 2))
with(data,{
        plot(data$DateTime, data$Global_active_power, type = "l",
        xlab = "", ylab ="Global Active Power")
        plot(data$DateTime, data$Voltage, type = "l",
             xlab = "datetime", ylab ="Voltage")
        plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab ="Energy Sub Metering")
        points(data$DateTime, data$Sub_metering_2, type = "l", col="Red")
        points(data$DateTime, data$Sub_metering_3, type = "l", col="Blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1),bty="n", 
               col=c("black", "red","blue"))   
        plot(data$DateTime, data$Global_reactive_power, type = "l",
             xlab = "datetime", ylab ="Global_reactive_power")
}
)

#Creating .PNG of Plot 4
dev.copy(png, file = "plot4.png", width = 480, height =480)
dev.off()