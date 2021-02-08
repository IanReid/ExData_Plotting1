# plot2.R
library(readr)
library(lubridate)
library(dplyr)

# Get input data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

consumption <- read_delim("household_power_consumption.txt", delim = ";", col_types = "ccddddddd", na="?")
start_date <- ymd("2007-02-01")
end_date <- ymd("2007-02-03")
consumption <- consumption %>% mutate(DT = dmy_hms(paste(Date, Time))) %>% filter(DT >= start_date, DT < end_date)

png('plot2.png', width = 480, height = 480)
with(consumption, plot(DT, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="", frame.plot=T))
dev.off()

