#Raw data processing of BME680 files
#this procedure assigns correct headers, merges dataset, and avgs up to 1 min
#using the read_all.py to record the data on the RasPi
#need to save raw data as a txt file first

library(openair)
library(lubridate)
library(dplyr)



#tidy up R, remove old dataframes
rm(list = ls())

setwd('/Users/yashar_iranpour/Desktop/R/HONO/valvedata')


Valvedat <- read.csv ("Sep9-Sep16_valvedata.txt",header = FALSE)
View(Valvedat)
colnames(Valvedat) <- c("datetime", "V3")
Valvedat$date <-mdy_hms(Valvedat$date)

all <- rbind(Valvedat)#, bme680_2, bme680_3)
View(all)




Valvedat_1 <-read.csv("fahim_data_5_min.csv")


all_1 <- rbind(Valvedat_1)





#temp is in C, press in hPa, RH is % and resistance on the gas sensor (gas_res) in ohms
colnames(all_1) <- c("date", "V4")
all_1$date <- ymd_hms(all_1$date)
View(all)






#average to 1 min 
all_1min_v4 <- timeAverage(all_1, avg.time = "5 min")

all_1min_v <- timeAverage(all, avg.time = "30 min")

View(all_1min_v4)
View(all_1min_v123)

#timePlot to check data

#####################################################################
#write csv file, change file name!!!
write.csv(all_1min_v4, "Extracted_May09_1miin_v4.csv", row.names = F)
write.csv(all_1min_v123, "Extracted_May09_1miin_v123.csv", row.names = F)