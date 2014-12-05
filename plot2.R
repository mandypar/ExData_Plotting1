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

## Black line graph of datetime against global active power with and title,
## expicit y-label, and no legend
png(file="plot2.png", width=480, height = 480)
with(data,
     plot(datetime,Global_active_power,type='l',xlab = "",ylab="Global Active Power (kilowatts)"
     )
)
dev.off()