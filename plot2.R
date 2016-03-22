library(lubridate)
library(ggplot2)
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
#x$Time <- strptime(x$Time, format  = "%H:%M:%S")
y <- x[x$Date == "2007-02-01" | x$Date =="2007-02-02",]
y$datetime <- as.POSIXct(paste0(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")
y$Global_active_power <- as.numeric(y$Global_active_power)

y %>%
ggplot(aes(datetime,Global_active_power)) +
  geom_line() +
  ylab("Global Active Power (kilowatts)") +
  xlab("")
