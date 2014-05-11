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

png("plot2.png",width = 480, height = 480)

with(data, plot(DateTime, Global_active_power, type = "l"
                , ylab = "Global Active Power (kilowatts)", xlab = ''))

dev.off()