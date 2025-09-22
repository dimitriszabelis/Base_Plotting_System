# Unzip and Load the data set
library(data.table)
tmp <- tempfile()
unzip("exdata_data_household_power_consumption.zip", 
      "household_power_consumption.txt", exdir = dirname(tmp))
df <- fread(file.path(dirname(tmp), "household_power_consumption.txt"), 
            sep = ";", na.strings = "?", header = T)
# str(df)
# summary(df)
unlink(dirname(tmp), recursive = TRUE)
rm(tmp)

df <- df[Date %in% c("1/2/2007", "2/2/2007")] # Subset
# str(df)
# summary(df)
# all(colSums(is.na(df)) == 0) # True

# Combine Date and Time and Convert to POSIXct
datetime_str <- paste(df$Date,df$Time,sep = " ")
datetime_col <- as.POSIXct(datetime_str, format = "%d/%m/%Y %H:%M:%S", 
                           tz = "Europe/Paris")

# Convert to POSIXct datetime class
df[, Date := datetime_col]      # Replace content in Date
setnames(df, "Date", "DateTime") # Rename Date to DateTime
df[, Time := NULL]      # Remove Time column

# View(df)

# Export Data
write.table(df, file = "dataset.txt", sep = ";", row.names = FALSE)

# Read with (another file):
# df <- read.table(file = "dataset.txt", sep = ";", header = T)
# -------------------