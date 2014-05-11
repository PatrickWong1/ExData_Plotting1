#This is a script used to work Project 1 Plot 3 of Exploratory Data Analysis.

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

###Get data in plotting shape###
data$Date<-as.Date(data$Date, format="%d/%m/%Y")    #convert date in categorical factor to R date

data.subsetted<-subset(data, data$Date=="2007-2-1" | data$Date=="2007-2-2") #subset 2 days
data.subsetted$gapkw<-as.numeric(as.character(data.subsetted$Global_active_power)) #convert factor to char to numeric
datetime<-paste(data.subsetted$Date,data.subsetted$Time) #combining date and time
data.subsetted$datetime<-strptime(datetime, format= "%Y-%m-%d %H:%M:%S")

data.subsetted$Sub_metering_1<-as.numeric(as.character(data.subsetted$Sub_metering_1)) #factor orginally
data.subsetted$Sub_metering_2<-as.numeric(as.character(data.subsetted$Sub_metering_2)) #factor orginally

data.subsetted$Global_reactive_power<-as.numeric(as.character(data.subsetted$Global_reactive_power)) #factor orginally
data.subsetted$Voltage<-as.numeric(as.character(data.subsetted$Voltage)) #factor orginally

###Do the plotting
par(mfrow=c(2,2))

#Plot Global Active Power
plot(data.subsetted$datetime, data.subsetted$gapkw, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

#plot Voltage
plot(data.subsetted$datetime, data.subsetted$Voltage, type="l", xlab="datetime", ylab = "Voltage")

#plot meterings
with(data.subsetted, plot(datetime,Sub_metering_1,type="l", xlab="",ylab="Energy submetering"))
with(data.subsetted, lines(datetime,Sub_metering_2,type="l", col="red"))
with(data.subsetted, lines(datetime,Sub_metering_3,type="l", col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", cex=0.75)

#plot global reactive power
plot(data.subsetted$datetime, data.subsetted$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power", xaxp  = c(0, 0.5, 5))


dev.copy(png, file = "plot4.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off()
