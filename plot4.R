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

plot4a <- function(data){
        plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")        
}

plot4b <- function(data){
        plot(data$Date, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")           
}

plot4c <- function(data){
        plot(data$Date, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(data$Date, data$Sub_metering_2, col = "red")
        lines(data$Date, data$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n', cex = 0.75, lwd = c(2.5,2.5,2.5))
}

plot4d <- function(data){
        plot(data$Date, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")            
}

plot4 <- function(){
        data <- readAndFormatData()
        par(mfrow = c(2,2))
        plot4a(data)
        plot4b(data)
        plot4c(data)
        plot4d(data)
        dev.copy(device = png, file = "plot4.png")
        dev.off()
}