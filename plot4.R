#Installs and loads important packages
install.packages ("data.table")
library (data.table)

##set the background colour
bg.color <- "white"
## bg.color <- "transparent"

## Load household power consumption dataset (only dates we are interested in)
dataHead <- read.csv ("~/Coursera/Exploratory Data Analysis/Code/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", nrows=1)
data <- fread("~/Coursera/Exploratory Data Analysis/Code/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",skip="1/2/2007",nrows=2880)
setattr(data, 'names', colnames(dataHead))

## Add a datetime column
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")

## Ensure Global_active_power is numeric
class(data$Global_active_power)="numeric"

## Create plot 4
# 4 figures arranged in 2 rows and 2 columns

png(file="plot4.png", width=480, height = 480)
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type="l", cex.lab=0.7, cex.axis=0.7)
plot(data$datetime, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l", cex.lab=0.7, cex.axis=0.7)
plot(data$datetime, data$Sub_metering_1, ,xlab="",ylab="Energy Sub Metering",type="l",col="black", cex.lab=0.7, cex.axis=0.7)
lines(data$datetime, data$Sub_metering_2,type="l",pch=2,col="red")
lines(data$datetime, data$Sub_metering_3,type="l",pch=3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, bty="n")
plot(data$datetime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l", cex.lab=0.7, cex.axis=0.7)
dev.off()
