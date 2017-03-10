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
#plot the line chart
plot(df$timestamp,df$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power(kilowatts)")
#save the graph as png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()