################## CODE TO GENERATE PLOT 4 OF THE FIRST ASSIGNMENT

#### Load the data and manipulate it 
#To run this code, we must be in the unzipped assignment folder containing the file "household_power_consumption.txt"

Sys.setlocale("LC_TIME", "English")
data <- read.csv(file="household_power_consumption.txt", sep=";", header= TRUE, na.strings=c("?"))
head(data) #Visualise the first rows of the dataset
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y") #We turn the values in the Date column into date variable types
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
my_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#### PLOT 4: 
png(filename="plot4.png")
par(mfcol = c(2,2), mar = c(4,4,4,2), oma = c(2,2,0,1)) #Divide the plotting screen into 4 spaces. We will fill them by col.
# In the first column, we have 2 plots we already built, so we recycle our code:

# 1st subplot: Global active power vs datetime

plot(my_data$Time, my_data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l",
     font.lab = 2, font.axis = 2)

# 2nd subplot: Energy submetering vs datetime

plot(my_data$Time, my_data$Sub_metering_1, col = "azure4", xlab = "", ylab = "Energy sub metering", type = "l",
     font.lab = 2, font.axis = 2)
lines(my_data$Time, my_data$Sub_metering_2, col = "red")
lines(my_data$Time, my_data$Sub_metering_3, col = "blue")
legend("topright",col = c("azure4","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1,text.font = 2, 
       bty = "n", xjust = 1)

# 3rd subplot: voltage vs datetime

plot(my_data$Time, my_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# 4th subplot: global reactive power vs datetime

plot(my_data$Time, my_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()