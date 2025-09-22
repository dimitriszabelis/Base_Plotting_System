df <- readRDS(file = "dataset.rds")
png(filename = "plot3.png", width = 480, height = 480)

with(df, {
        plot(DateTime, Sub_metering_1, col = "black",xaxt = "n",
             type = "l",
             xlab = "Weekday",
             ylab = "Energy Sub-Metering",
             ylim = c(0,max(df$Sub_metering_1,df$Sub_metering_2,df$Sub_metering_3)+2),
             main = "Sub-Metering")
        
        lines(DateTime, Sub_metering_2,type = "l", col = "red")
        lines(DateTime, Sub_metering_3,type = "l", col = "blue")
        
        axis.POSIXct(1, x = DateTime, format = "%a %H:%M")
})

legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
