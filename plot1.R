print(getwd())
setwd("C:/Exploratory Data Analysis/week 1/Course Project")
print(getwd())

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
for (i in temp) unzip(i)
unlink(temp)
 
data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", stringsAsFactors = FALSE)

print(names(data))
print(str(data))
print(summary(data))
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
print(names(subdata))
print(str(subdata))
print(summary(subdata))

with(subdata,hist(Global_active_power,xlab= "Global Active Power (kilowatts)", main="Global Active Power",col="red"))

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
