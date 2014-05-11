#This is a script used to work Project 1 Plot 2 of Exploratory Data Analysis.

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")    #convert date in categorical factor to R date


data.subsetted<-subset(data, data$Date=="2007-2-1" | data$Date=="2007-2-2") #subset 2 days
data.subsetted$gapkw<-as.numeric(as.character(data.subsetted$Global_active_power)) #convert factor to char to numeric
datetime<-paste(data.subsetted$Date,data.subsetted$Time) #combining date and time
data.subsetted$datetime<-strptime(datetime, format= "%Y-%m-%d %H:%M:%S")

plot(data.subsetted$datetime, data.subsetted$gapkw, type="l", xlab="", ylab = "Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off()
