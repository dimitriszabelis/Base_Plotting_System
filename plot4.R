df <- readRDS(file = "dataset.rds")
png(filename = "plot4.png", width = 480, height = 480)

# Define ticks at midnight on Thu, Fri, Sat
ticks <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-02 00:00:00", 
                      "2007-02-03 00:00:00"), tz = "Europe/Paris")

par(mfcol = c(2,2), mar = c(5,4,2,1) ,oma = c(0,0,0,0))

# 1st
plot(df$DateTime,df$Global_active_power, type = "l", xaxt = "n",
     ylab = "Global Active Power", main = "Power Consumption Over Time",
     xlab = "Weekday", ylim = range(df$Global_active_power)
     )
axis.POSIXct(1, x = df$DateTime, at = ticks, format = "%a")

# 2nd
with(df, {
        plot(DateTime, Sub_metering_1, col = "black",xaxt = "n",
             type = "l",
             xlab = "Weekday",
             ylab = "Energy Sub-Metering",
             ylim = c(0,max(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3)),
             main = "Sub-Metering Over Time")
        
        lines(DateTime, Sub_metering_2,type = "l", col = "red")
        lines(DateTime, Sub_metering_3,type = "l", col = "blue")
        
        axis.POSIXct(1, x = DateTime, at = ticks, format = "%a")
})

legend("topright", col = c("black","red","blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# 3rd
plot(df$DateTime,df$Voltage, type = "l", xaxt = "n",
     ylab = "Voltage", main = "Voltage Over Time",
     xlab = "Weekday", ylim = range(df$Voltage)
     )
axis.POSIXct(1, x = df$DateTime, at = ticks, format = "%a")

# 4th
plot(df$DateTime,df$Global_reactive_power, type = "l", xaxt = "n",
     ylab = "Global Reactive Power", main = "Global Reactive Power Over Time",
     xlab = "Weekday", ylim = range(df$Global_reactive_power)
     )
axis.POSIXct(1, x = df$DateTime, at = ticks, format = "%a")

dev.off()