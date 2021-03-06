################## CODE TO GENERATE PLOT 2 OF FIRST ASSIGNMENT

##### Load the data and manipulate it
#To run this code, we must be in the unzipped assignment folder containing the file "household_power_consumption.txt"

Sys.setlocale("LC_TIME", "English")
data <- read.csv(file="household_power_consumption.txt", sep=";", header= TRUE, na.strings=c("?"))
head(data) #Visualise the first rows of the dataset
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y") #We turn the values in the Date column into date variable types
data$Time <- strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
my_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

##### PLOT 2: LINES PLOT OF GLOBAL ACTIVE POWER VS DATETIME

plot(my_data$Time, my_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l",
     font.lab = 2, font.axis = 2)

#We save the image to png
dev.copy (png, file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()