library(lubridate)
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
y <- x[x$Date == "2007-02-01" | x$Date =="2007-02-02",]
y$Global_active_power <- as.numeric(y$Global_active_power)
quartz("plot1", 2.4, 2.4, file = "plot1.png")
plot1.png <- hist(y$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
quartz.save()
