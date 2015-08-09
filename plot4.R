print(getwd())
setwd("C:/Exploratory Data Analysis/week 1/Course Project")
print(getwd())

# temp <- tempfile()
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
# for (i in temp) unzip(i)
# unlink(temp)
 
data <- read.table('household_power_consumption.txt',header=TRUE,sep=';',na.strings="?", stringsAsFactors = FALSE)

print(names(data))
print(str(data))
print(summary(data))
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
print(names(subdata))
print(str(subdata))
print(summary(subdata))

tempo <- paste(as.Date(subdata$Date,format="%d/%m/%Y"),subdata$Time,sep="")
subdata$meu_tempo <- as.POSIXlt(tempo)
print(str(subdata$meu_tempo))
#print(myday$year)
print(summary(subdata))

par(mfrow=c(2,2))
with(subdata,{plot(meu_tempo,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", main="",type="l",col="black")
              plot(meu_tempo,Voltage,xlab="datetime",ylab="Voltage", main="",type="l",col="black")
              plot(meu_tempo,Sub_metering_1,xlab="",ylab="Energy sub metering", main="",type="l",col="black")
              lines(meu_tempo,Sub_metering_2,main="",type="l",col="red")
              lines(meu_tempo,Sub_metering_3,main="",type="l",col="blue")
              legend("topright",pch=1,cex=0.25,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
              plot(meu_tempo,Global_reactive_power,xlab="datetime",ylab="Global Reactive Power (kilowatts)", main="",type="l",col="black")
              
              })
par(mfrow=c(1,1))

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()
