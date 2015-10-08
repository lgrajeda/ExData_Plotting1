#Exploratory data analysis
#Project 1-plot1
#UC Irvine Machine Learning Repository



# 1. loading the data (2,075,259 rows and 9 columns)
#-----------------------------------------------------
#RAM memory needed?
((2075259*9*8)/2^20)*2
memory.size()

#open and load data
setwd("~/2014-09-10_FETP/Libros y cursos/coursera/4.exploratory data analysis/Exploratory_Analysis_Project_1")
URL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL, destfile = "Electric Power Consumption.zip")
unzip("Electric Power Consumption.zip")
list.files()
data<-read.table(file = "household_power_consumption.txt", na.strings = "?", header = TRUE, sep=";")



#change the class of the date variable
summary(data)
str(data)
data$Date
data$Time
x<-paste(data$Date, data$Time)
x
data$DateTime<-strptime(x,"%d/%m/%Y %H:%M:%S" )
head(data)
class(data$DateTime)


#subset to the specified dates

data2<-subset(data, data$DateTime>="2007-02-01 00:00:00" & data$DateTime<="2007-02-02 23:59:59")
class(data2$DateTime)

#plot 4
setwd("~/2014-09-10_FETP/Libros y cursos/coursera/4.exploratory data analysis/Exploratory_Analysis_Project_1")
png(filename = "plot4.png", width=480, height = 480)
Sys.setlocale(category = "LC_TIME", locale = "English_USA.1252")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
#plot 4.1
plot(data2$DateTime, data2$Global_active_power, type="l", ylab = "Global Active Power", xlab="")
#plot 4.2
plot(data2$DateTime, data2$Voltage, type = "l", ylab="Voltage", xlab="datetime")
#plot 4.3
plot(data2$DateTime, data2$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data2$DateTime, data2$Sub_metering_2, col="red")
lines(data2$DateTime, data2$Sub_metering_3, col="blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
#plot 4.4
plot(data2$DateTime, data2$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")
dev.off()

