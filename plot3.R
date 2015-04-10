readAndFormatData <- function(){
        mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")
        mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")
        data <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
        data[,1] <- paste(data[,1], data[,2])
        data[,1] <- as.POSIXct(x = data[,1], format = "%Y-%m-%d %H:%M:%S")
        for(i in 3:9){
                data[,i] <- as.numeric(as.character(data[,i]))
        }
        data
}

plot3 <- function(){
        data <- readAndFormatData()
        plot(data$Date, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(data$Date, data$Sub_metering_2, col = "red")
        lines(data$Date, data$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = c(2.5,2.5,2.5))
        dev.copy(device = png, file = "plot3.png")
        dev.off()
}