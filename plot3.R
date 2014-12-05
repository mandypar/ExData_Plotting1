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

## Create plot 3
png(file="plot3.png", width=480, height = 480)
with(data,
plot(datetime, Sub_metering_1, ,xlab="",ylab="Energy Sub Metering",type="l",col="black")
lines(datetime, Sub_metering_2,type="l",pch=2,col="red")
lines(datetime, Sub_metering_3,type="l",pch=3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)
) )
dev.off()
