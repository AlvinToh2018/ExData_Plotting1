#plot2.R
#Reading and subsetting power consumption data

#Reading and subsetting power consumption data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
graph_range <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date var for graphing by appending the Time var and then formatting it
graph_range$Date <- paste(graph_range$Date, graph_range$Time)
graph_range$Date <- strptime(graph_range$Date, format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(graph_range$Date,as.numeric(as.character(graph_range$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
