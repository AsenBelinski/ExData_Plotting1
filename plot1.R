##
##  plot1.R 
## 
##
## Loading the data
  library(data.table)
  working_set <- fread("..\\household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
  working_subset1 <- working_set[working_set$Date=="1/2/2007", ]
  working_subset2 <- working_set[working_set$Date=="2/2/2007", ]
  working_subset <- rbind(working_subset1,working_subset2)
  rm(working_set,working_subset1,working_subset2)
  working_subset[,Date:=as.Date(Date,"%d/%m/%Y")]
  working_subset[,Time:=as.POSIXct(strptime(paste(Date,Time),"%Y-%m-%d %T"))]
##
## Let's create graphic device and the plot and save it
  png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
  hist(working_subset$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  dev.off()