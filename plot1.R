#plot1.R
#Reading and subsetting power consumption data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
graph_range <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#calling the basic plot function
png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(graph_range$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()



