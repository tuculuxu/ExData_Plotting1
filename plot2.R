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

plot2 <- function(){
        data <- readAndFormatData()
        plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.copy(device = png, file = "plot2.png")
        dev.off()
}