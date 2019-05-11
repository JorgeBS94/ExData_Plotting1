################## CODE TO GENERATE PLOT 3 OF THE FIRST ASSIGNMENT

#### Load the data and manipulate it 
#To run this code, we must be in the unzipped assignment folder containing the file "household_power_consumption.txt"

Sys.setlocale("LC_TIME", "English")
data <- read.csv(file="household_power_consumption.txt", sep=";", header= TRUE, na.strings=c("?"))
head(data) #Visualise the first rows of the dataset
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y") #We turn the values in the Date column into date variable types
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
my_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#### PLOT 3: ENERGY SUBMETERING VS TIME FOR 3 TYPES OF ENERGY

plot.new()
plot(my_data$Time, my_data$Sub_metering_1, col = "azure4", xlab = "", ylab = "Energy sub metering", type = "l",
     font.lab = 2, font.axis = 2)
lines(my_data$Time, my_data$Sub_metering_2, col = "red")
lines(my_data$Time, my_data$Sub_metering_3, col = "blue")
legend("topright",col = c("azure4","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty = 1,text.font = 2)

#We save the image to png
dev.copy (png, file = "plot3.png",width = 480, height = 480, units = "px")
dev.off()