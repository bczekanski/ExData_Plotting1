library(lubridate)
library(ggplot2)
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

y <- x[x$Date == "2007-02-01" | x$Date =="2007-02-02",]
y$datetime <- as.POSIXct(paste0(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)

y %>%
  ggplot(aes(datetime)) +
  geom_line(aes(y = Sub_metering_1, color = "blue")) + 
  geom_line(aes(y = Sub_metering_2, color = "black")) +
  geom_line(aes(y = Sub_metering_3, color = "red"))
