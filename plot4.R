data <- read.table("household_power_consumption.txt", sep=";", header = FALSE
                   , skip = 66637, nrows = 2880
                   , col.names = c("Date", "Time", "Global_active_power"
                                   , "Global_reactive_power","Voltage"
                                   ,"Global_intensity","Sub_metering_1"
                                   ,"Sub_metering_2","Sub_metering_3")
                   , colClasses = c("character", "character", "numeric"
                                    , "numeric", "numeric", "numeric"
                                    , "numeric", "numeric", "numeric")
)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
## Set device to PNG
png("plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

## First Plot
with(data, plot(DateTime, Global_active_power, type = "l"
                , ylab = "Global Active Power", xlab = ""))

## Second Plot
with(data, plot(DateTime, Voltage, type = "l"
                , ylab = "Voltage", xlab = "" ))

## Third Plot
with(data, plot(DateTime, Sub_metering_1
                , type = "l"
                , ylab = "Energy sub metering", xlab = "")
)
lines(data$DateTime,data$Sub_metering_2, col = "red")
lines(data$DateTime,data$Sub_metering_3, col = "blue")
legend("topright",lwd = 1,col = c("black", "red", "blue")
       , legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")
       , bty = "n")

## Fourth Plot
with(data, plot(DateTime,Global_reactive_power
                , type = "l"
                , xlab = "datetime")
)

## Turn the device off
dev.off()
