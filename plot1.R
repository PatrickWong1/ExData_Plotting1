#This is a script used to work Project 1 of Exploratory Data Analysis.

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")    #convert date in categorical factor to R date
%data$Time<-strptime(data$Time, format="%H:%M:%S")   #convert Time in categorical factor to R time

data.subsetted<-subset(data, data$Date=="2007-2-1" | data$Date=="2007-2-2") %subset 2 days
data.subsetted$gapkw<-as.numeric(as.character(data.subsetted$Global_active_power)) %convert factor to char to numeric
#hist(data.subsetted$gapkw, col="red", main= "Global Active Power", xlab= "Global Active POwer (kilowatts)", xaxp  = c(0, 1200, 6),yaxp= c(0,6,3) )
hist(data.subsetted$gapkw, col="red", main= "Global Active Power", xlab= "Global Active POwer (kilowatts)" )
dev.copy(png, file = "plot1.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off()
