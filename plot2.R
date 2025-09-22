df <- readRDS(file = "dataset.rds")
png(filename = "plot2.png", width = 480, height = 480)
plot(df$DateTime,df$Global_active_power, type = "l", xaxt = "n",
     ylab = "Global Active Power (kilowatts)", main = "Power Consumption Over Time",
     xlab = "Weekday", ylim = c(0,8))
axis.POSIXct(1, x = df$DateTime, format = "%a %H:%M")
dev.off()
