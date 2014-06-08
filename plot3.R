data <- read.csv("data/household_power_consumption.txt", sep=";", 
                 colClasses=c("character", "character", "numeric",  
                              "numeric",  "numeric",  "numeric", 
                              "numeric",  "numeric",  "numeric"), na.strings = "?")
data <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,  format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English") 
png("plot3.png", width=480, height=480)

with(data, {plot(Time, Sub_metering_1, type="n", 
                 ylab="Energy sub metering", xlab="")
            lines(Time, Sub_metering_1, col="Black")
            
            lines(Time, Sub_metering_2, col="Red")

            lines(Time, Sub_metering_3, col="Blue")
            legend("topright", 
                col=c("Black", "Red", "Blue"), lty=c(1,1),
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            })

dev.off()