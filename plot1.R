df <- readRDS(file = "dataset.rds")
png(filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     xlim = c(0,8), main = "Histogram of Global Active Power")
dev.off()
