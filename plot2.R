#Exploratory Data Analysis - Course Project 1
# uncomment if you don't have png already
#install.packages("png") 
library("png")

# path to the file is assuming ../data/project1/ is the path to the data, change subFolder as you need
subFolder = '../data/project1/'
shortFileName = 'household_power_consumption.txt'
fullFileName = paste(subFolder, shortFileName, sep="")

#setup the date format and col clcasses
setClass("powerDate")
setAs("character", "powerDate", function(from) as.Date(from, format="%d/%m/%Y"))
colClasses = c('powerDate', 'factor','numeric','numeric','numeric','numeric','numeric','numeric','numeric')

#uncomment this for the full party
powerDataFull = read.delim(fullFileName, header=TRUE, sep=";", na.strings = "?",colClasses=colClasses)
#comment this out to stop the testing size
#samp = read.delim('./data/project1/sample.txt', header=TRUE, sep=";", na.strings = "?", colClasses=colClasses)
dateCulledPowerData = powerDataFull[(powerDataFull$Date < "2007-02-03" & powerDataFull$Date > "2007-01-31"),]
rm(powerDataFull)

# reformat our date for ease of plotting
dateCulledPowerData$posDate <- strptime(paste(dateCulledPowerData[,1], dateCulledPowerData[,2], sep=" "),format="%Y-%m-%d %H:%M:%s")
#lets plot!
png(filename="plot2.png", width = 480, height=480)
plot(dateCulledPowerData[,10], dateCulledPowerData[,3], type="l",  ylab="GLobal Active Power (kilowatts)", xlab="")
dev.off()
