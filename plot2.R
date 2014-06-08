data <- read.csv("data/household_power_consumption.txt", sep=";", 
                 colClasses=c("character", "character", "numeric",  
                              "numeric",  "numeric",  "numeric", 
                              "numeric",  "numeric",  "numeric"), na.strings = "?")
data <- subset(data,  Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,  format="%d/%m/%Y")
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

Sys.setlocale("LC_TIME", "English") 
png("plot2.png", width=480, height=480)

with(data, {plot(Time, Global_active_power, type="n", 
                 ylab="Global Active Power (killowatts)", xlab="")
             lines(Time, Global_active_power)})

dev.off()