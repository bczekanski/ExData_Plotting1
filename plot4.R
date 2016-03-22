library(lubridate)
library(ggplot2)
library(grid)
x <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
y <- x[x$Date == "2007-02-01" | x$Date =="2007-02-02",]
y$datetime <- as.POSIXct(paste0(y$Date, y$Time), format="%Y-%m-%d %H:%M:%S")
y$Global_active_power <- as.numeric(y$Global_active_power)
y$Sub_metering_1 <- as.numeric(y$Sub_metering_1)
y$Sub_metering_2 <- as.numeric(y$Sub_metering_2)
y$Sub_metering_3 <- as.numeric(y$Sub_metering_3)
y$Voltage<- as.numeric(y$Voltage)
y$Global_reactive_power <- as.numeric(y$Global_reactive_power)

y %>%
  ggplot(aes(datetime,Global_active_power)) +
  geom_line() +
  ylab("Global Active Power") +
  xlab("") -> n1

y %>%
  ggplot(aes(datetime,Voltage)) +
  geom_line() +
  ylab("Voltage") +
  xlab("datetime") -> n2
y %>%
  ggplot(aes(datetime)) +
  ylab("Energy Sub Metering") +
  geom_line(aes(y = Sub_metering_1, color = "blue")) +
  geom_line(aes(y = Sub_metering_2, color = "black")) +
  geom_line(aes(y = Sub_metering_3, color = "red")) -> n3

y %>%
  ggplot(aes(datetime,Global_reactive_power)) +
  geom_line() +
  xlab("datetime") -> n4


pushViewport(viewport(layout = grid.layout(2, 2)))
print(n1, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
print(n2, vp = viewport(layout.pos.row = 1, layout.pos.col = 2))
print(n3, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
print(n4, vp = viewport(layout.pos.row = 2, layout.pos.col = 2))

