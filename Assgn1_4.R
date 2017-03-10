rm(list = ls())

#data loading
setwd("C:/Users/yshi5/Downloads/Fhousehold_power_consumption")
#read the file
dat = read.csv("household_power_consumption.txt",header = TRUE,sep = ";")
#convert date format
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
#subset date for only two days
df_1 <- subset(dat,Date == "2007-02-01")
df_2 <- subset(dat,Date == "2007-02-02")
df <-  rbind(df_1,df_2)
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#convert date type to numeric
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
#plot the charts
par(mfrow = c(2,2))
#PLOT 1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#PLOT 2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot 3
plot(df$timestamp,df$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col = "red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
#plot 4
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save graph
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()