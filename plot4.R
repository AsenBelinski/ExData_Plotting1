##
##  plot4.R 
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
  png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12,bg = "white")
  par(mfrow = c(2,2))
  ## The day names are dependent on the users computer settings - mine are in Bulgarian 
  ## this is way the result on the x axis captions can seem a bit strange
  #
  # Top Left
  with(working_subset, plot(Time, Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))
  # Top Right
  with(working_subset, plot(Time, Voltage,type = "l",xlab="datatime"))
  # Bottom Left
  with(working_subset, plot(Time,Sub_metering_1,type="l",xlab="",ylab = "Energy sub metering"))
  with(working_subset, lines(Time,Sub_metering_2,type="l",col="red"))
  with(working_subset, lines(Time,Sub_metering_3,type="l",col="blue"))
  legend("topright",bty="n", lwd =c(1,1,1), col= c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
  
  #Bottom Right
  with(working_subset, plot(Time,Global_reactive_power,type = "l",xlab="datatime"))
  
  dev.off()
