##Plot 3

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
png(filename="plot3.png", width = 480, height = 480)
plot(datetime, power_subset$Sub_metering_1, type = "l", lty = 1, 
     ylab="Energy sub metering", 
     xlab=" ", 
     xaxt = "n")
lines(datetime, power_subset$Sub_metering_2,
      type = "l",
      col = "red")       
lines(datetime, power_subset$Sub_metering_3,
      type = "l",
      col = "blue")       
legend("topright", legend=c("Sub_metering_1", 
                            "Sub_metering_2",
                            "Sub_metering_3"), 
       col = c("black", "red", "blue"),
       lty=1)
tick_positions <- as.POSIXct(c("2007-02-01 00:00:00", 
                               "2007-02-02 00:00:00", 
                               "2007-02-03 00:00:00"))
tick_labels <- c("Thu", "Fri", "Sat")
axis(side = 1, at = tick_positions, labels = tick_labels)
dev.off()