##Plot 4

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
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

#Global Active Power
plot(datetime, Global_Active_Power, type = "l", lty = 1, 
     ylab="Global Active Power", 
     xlab=" ",
     cex.lab=0.75,
     xaxt = "n")
tick_positions <- as.POSIXct(c("2007-02-01 00:00:00", 
                               "2007-02-02 00:00:00", 
                               "2007-02-03 00:00:00"))
tick_labels <- c("Thu", "Fri", "Sat")
axis(side = 1, at = tick_positions, labels = tick_labels, cex.axis=0.85)

#Voltage
plot(datetime, power_subset$Voltage, type = "l", lty = 1, 
     ylab="Voltage", 
     xlab="datetime",
     cex.axis=0.75,
     cex.lab=0.75,
     xaxt = "n")
tick_positions <- as.POSIXct(c("2007-02-01 00:00:00", 
                               "2007-02-02 00:00:00", 
                               "2007-02-03 00:00:00"))
tick_labels <- c("Thu", "Fri", "Sat")
axis(side = 1, at = tick_positions, labels = tick_labels, cex.axis=0.85)

#Sub-Metering
plot(datetime, power_subset$Sub_metering_1, type = "l", lty = 1, 
     ylab="Energy sub metering", 
     xlab=" ",
     cex.lab=0.75,
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
       cex = 0.6,
       lty=1)
tick_positions <- as.POSIXct(c("2007-02-01 00:00:00", 
                               "2007-02-02 00:00:00", 
                               "2007-02-03 00:00:00"))
tick_labels <- c("Thu", "Fri", "Sat")
axis(side = 1, at = tick_positions, labels = tick_labels, cex.axis=0.85)

##Global Reactive Power
plot(datetime, power_subset$Global_reactive_power, type = "l", lty = 1, 
     ylab="Global_reactive_power", 
     xlab="datetime",
     cex.axis=0.65,
     cex.lab=0.75,
     xaxt = "n")
tick_positions <- as.POSIXct(c("2007-02-01 00:00:00", 
                               "2007-02-02 00:00:00", 
                               "2007-02-03 00:00:00"))
tick_labels <- c("Thu", "Fri", "Sat")
axis(side = 1, at = tick_positions, labels = tick_labels, cex.axis=0.85)
dev.off()