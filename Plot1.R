##Plot 1

setwd("/Users/brettem/Dropbox/Coursera_R/R_Assignments")
power_data<-read.table("household_power_consumption.txt", 
                       header=TRUE,
                       sep=";",
                       stringsAsFactors = FALSE)
power_data$Date<-as.Date(power_data$Date, format = "%d/%m/%Y")
power_data$Time<-strptime(power_data$Time, "%H:%M:%S")
power_subset <- power_data[
  power_data$Date == as.Date("2007-02-01") |
    power_data$Date == as.Date("2007-02-02"),
]
Global_Active_Power<-as.numeric(power_subset$Global_active_power)
Time <- format(as.POSIXct(power_subset$Time), "%H:%M:%S")
datetime <- as.POSIXct(paste(power_subset$Date, Time), format="%Y-%m-%d %H:%M:%S")

##Generate Plot
png(filename="plot1.png", width = 480, height = 480)
hist(Global_Active_Power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()
