readAndFormatData <- function(){
        mydata <- read.table("household_power_consumption.txt", header = T, sep = ";")
        mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")
        data <- subset(mydata, Date == "2007-02-01" | Date == "2007-02-02")
        for(i in 3:9){
                data[,i] <- as.numeric(as.character(data[,i]))
        }
        data
}

plot1 <- function(){
        data <- readAndFormatData()
        hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.copy(device = png, file = "plot1.png")
        dev.off()
}