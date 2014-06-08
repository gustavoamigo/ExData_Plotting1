data <- read.csv("data/household_power_consumption.txt", sep=";", 
                 colClasses=c("character", "character", "numeric",  
                              "numeric",  "numeric",  "numeric", 
                              "numeric",  "numeric",  "numeric"), na.strings = "?")
data <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,  format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (killowatts)",
     ylim=c(0,1200))
dev.off()