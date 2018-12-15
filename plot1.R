download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip("data.zip")

power_file <- "household_power_consumption.txt"
consumption_data_full <- read.table(power_file, header = TRUE, sep = ";", 
                               stringsAsFactors = FALSE, na.strings="?", colClasses = c(rep("character", 2), rep("numeric", 7)))
consumption_data <- subset(consumption_data_full, Date %in% c("1/2/2007", "2/2/2007"))

Date_time <- paste(consumption_data$Date, consumption_data$Time, sep = " ")
consumption_data$Date <- as.Date(consumption_data$Date, format="%d/%m/%Y")
consumption_data$TimeDate <- strptime(Date_time, format = "%d/%m/%Y %H:%M:%S")

hist(consumption_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "orangered3")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

