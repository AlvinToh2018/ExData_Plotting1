#plot3.R

#Reading and subsetting power consumption data
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
graph_range <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# Transforming the Date var for graphing by appending the Time var and then formatting it
graph_range$Date <- paste(graph_range$Date, graph_range$Time)
graph_range$Date <- strptime(graph_range$Date, format="%d/%m/%Y %H:%M:%S")


png("plot3.png", width = 480, height = 480)

plot(graph_range$Date,graph_range$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(graph_range$Date,as.numeric(as.character(graph_range$Sub_metering_1)))
lines(graph_range$Date,as.numeric(as.character(graph_range$Sub_metering_2)),col="red")
lines(graph_range$Date,as.numeric(as.character(graph_range$Sub_metering_3)),col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()