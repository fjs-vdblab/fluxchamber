# For Chamber open/close status

library(openair)
library(readr)
library(ggplot2)
library(gridExtra)
library(ggpubr)
library(data.table)
library(lubridate)
library(dplyr)
library(openxlsx)

rm(list=ls(all=TRUE)) #clear all previous variables

################################################################################################

#set working directory
setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_30_data')

#Measurment Chamber Sensors: 

#Open Close status

dat_1 <- read.csv("FRMonitor_0123.log", sep = " ", header =F)
dat_1 <- select(dat_1,1,4)
colnames(dat_1) <- c("epoch", "Open/close status")
dat_1$date = sprintf((dat_1$epoch/86400+25569), fmt='%#.7f')
dat_1$date <- convertToDateTime(dat_1$date, tx = "EST")

dat_2 <- read.csv("FRMonitor_0124.log", sep = " ", header =F)
dat_2 <- select(dat_2,1,4)
colnames(dat_2) <- c("epoch", "Open/close status")
dat_2$date = sprintf((dat_2$epoch/86400+25569), fmt='%#.7f')
dat_2$date <- convertToDateTime(dat_2$date, tx = "EST")


dat_3 <- read.csv("FRMonitor_0125.log", sep = " ", header =F)
dat_3 <- select(dat_3,1,4)
colnames(dat_3) <- c("epoch", "Open/close status")
dat_3$date = sprintf((dat_3$epoch/86400+25569), fmt='%#.7f')
dat_3$date <- convertToDateTime(dat_3$date, tx = "EST")



dat_4 <- read.csv("FRMonitor_0126.log", sep = " ", header =F)
dat_4 <- select(dat_4,1,4)
colnames(dat_4) <- c("epoch", "Open/close status")
dat_4$date = sprintf((dat_4$epoch/86400+25569), fmt='%#.7f')
dat_4$date <- convertToDateTime(dat_4$date, tx = "EST")


dat_5 <- read.csv("FRMonitor_0127.log", sep = " ", header =F)
dat_5 <- select(dat_5,1,4)
colnames(dat_5) <- c("epoch", "Open/close status")
dat_5$date = sprintf((dat_5$epoch/86400+25569), fmt='%#.7f')
dat_5$date <- convertToDateTime(dat_5$date, tx = "EST")



dat_6 <- read.csv("FRMonitor_0128.log", sep = " ", header =F)
dat_6 <- select(dat_6,1,4)
colnames(dat_6) <- c("epoch", "Open/close status")
dat_6$date = sprintf((dat_6$epoch/86400+25569), fmt='%#.7f')
dat_6$date <- convertToDateTime(dat_6$date, tx = "EST")


dat_7 <- read.csv("FRMonitor_0129.log", sep = " ", header =F)
dat_7 <- select(dat_7,1,4)
colnames(dat_7) <- c("epoch", "Open/close status")
dat_7$date = sprintf((dat_7$epoch/86400+25569), fmt='%#.7f')
dat_7$date <- convertToDateTime(dat_7$date, tx = "EST")

#######################################
#Fertilizer
dat_8 <- read.csv("FRMonitor_0130.log", sep = " ", header =F)
dat_8 <- select(dat_8,1,4)
colnames(dat_8) <- c("epoch", "Open/close status")
dat_8$date = sprintf((dat_8$epoch/86400+25569), fmt='%#.7f')
dat_8$date <- convertToDateTime(dat_8$date, tx = "EST")


dat_9 <- read.csv("FRMonitor_0131.log", sep = " ", header =F)
dat_9 <- select(dat_9,1,4)
colnames(dat_9) <- c("epoch", "Open/close status")
dat_9$date = sprintf((dat_9$epoch/86400+25569), fmt='%#.7f')
dat_9$date <- convertToDateTime(dat_9$date, tx = "EST")


dat_10 <- read.csv("FRMonitor_0132.log", sep = " ", header =F)
dat_10 <- select(dat_10,1,4)
colnames(dat_10) <- c("epoch", "Open/close status")
dat_10$date = sprintf((dat_10$epoch/86400+25569), fmt='%#.7f')
dat_10$date <- convertToDateTime(dat_10$date, tx = "EST")

dat_11<- read.csv("FRMonitor_0133.log", sep = " ", header =F)
dat_11 <- select(dat_11,1,4)
colnames(dat_11) <- c("epoch", "Open/close status")
dat_11$date = sprintf((dat_11$epoch/86400+25569), fmt='%#.7f')
dat_11$date <- convertToDateTime(dat_11$date, tx = "EST")

dat_12<- read.csv("FRMonitor_0134.log", sep = " ", header =F)
dat_12 <- select(dat_12,1,4)
colnames(dat_12) <- c("epoch", "Open/close status")
dat_12$date = sprintf((dat_12$epoch/86400+25569), fmt='%#.7f')
dat_12$date <- convertToDateTime(dat_12$date, tx = "EST")

dat_13<- read.csv("FRMonitor_0135.log", sep = " ", header =F)
dat_13 <- select(dat_13,1,4)
colnames(dat_13) <- c("epoch", "Open/close status")
dat_13$date = sprintf((dat_13$epoch/86400+25569), fmt='%#.7f')
dat_13$date <- convertToDateTime(dat_13$date, tx = "EST")

dat_14<- read.csv("FRMonitor_0136.log", sep = " ", header =F)
dat_14 <- select(dat_14,1,4)
colnames(dat_14) <- c("epoch", "Open/close status")
dat_14$date = sprintf((dat_14$epoch/86400+25569), fmt='%#.7f')
dat_14$date <- convertToDateTime(dat_14$date, tx = "EST")


status <- rbind(dat_1, dat_2,dat_3,dat_4,dat_5,dat_6,dat_7,dat_8, dat_9, dat_10, dat_11, dat_12, dat_13, dat_14)#, dat_3, dat_4, dat_5, dat_6, dat_7)
status_min1 <- timeAverage(status, avg.time = "1 min")



status_Fertilizer <- rbind(dat_8,dat_9,dat_10,dat_11,dat_12)
status_min1_Fert <- timeAverage(status_Fertilizer, avg.time = "1 min")

status_min1$date = status_min1$date -4*60*60

#export csv files CHANGE NAME!!!!
#export 1 mins raw data
write.csv(status_min1, "FR_switching_ALL_days.csv", row.names = F)




#########################
#SWC 

#set working directory
setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_30_data')
#import data
##Sample Pool A
#SWC
#Day 1

#Fertilizer Day 1 



SWC_1 <- read.csv("FRMonitor_0123.log", sep = " ", header =F)
SWC_1 <- select(SWC_1,1,7)
colnames(SWC_1) <- c("epoch", "Voltage")
#Day Fertilizer Day 2
SWC_2 <- read.csv("FRMonitor_0124.log", sep = " ", header =F)
SWC_2 <- select(SWC_2,1,7)
colnames(SWC_2) <- c("epoch", "Voltage")

#Fertilizer Day 3
SWC_3 <- read.csv("FRMonitor_0125.log", sep = " ", header =F)
SWC_3 <- select(SWC_3,1,7)
colnames(SWC_3) <- c("epoch", "Voltage")

SWC_4 <- read.csv("FRMonitor_0126.log", sep = " ", header =F)
SWC_4 <- select(SWC_4,1,7)
colnames(SWC_4) <- c("epoch", "Voltage")

SWC_5 <- read.csv("FRMonitor_0127.log", sep = " ", header =F)
SWC_5 <- select(SWC_5,1,7)
colnames(SWC_5) <- c("epoch", "Voltage")


SWC_6 <- read.csv("FRMonitor_0128.log", sep = " ", header =F)
SWC_6 <- select(SWC_6,1,7)
colnames(SWC_6) <- c("epoch", "Voltage")

SWC_7 <- read.csv("FRMonitor_0129.log", sep = " ", header =F)
SWC_7 <- select(SWC_7,1,7)
colnames(SWC_7) <- c("epoch", "Voltage")


SWC_8 <- read.csv("FRMonitor_0130.log", sep = " ", header =F)
SWC_8 <- select(SWC_8,1,7)
colnames(SWC_8) <- c("epoch", "Voltage")
#Day Fertilizer Day 2
SWC_9 <- read.csv("FRMonitor_0131.log", sep = " ", header =F)
SWC_9 <- select(SWC_9,1,7)
colnames(SWC_9) <- c("epoch", "Voltage")

#Fertilizer Day 3
SWC_10 <- read.csv("FRMonitor_0132.log", sep = " ", header =F)
SWC_10 <- select(SWC_10,1,7)
colnames(SWC_10) <- c("epoch", "Voltage")

SWC_11 <- read.csv("FRMonitor_0133.log", sep = " ", header =F)
SWC_11 <- select(SWC_11,1,7)
colnames(SWC_11) <- c("epoch", "Voltage")

SWC_12 <- read.csv("FRMonitor_0134.log", sep = " ", header =F)
SWC_12 <- select(SWC_12,1,7)
colnames(SWC_12) <- c("epoch", "Voltage")

SWC_13 <- read.csv("FRMonitor_0135.log", sep = " ", header =F)
SWC_13 <- select(SWC_13,1,7)
colnames(SWC_13) <- c("epoch", "Voltage")

SWC_14 <- read.csv("FRMonitor_0136.log", sep = " ", header =F)
SWC_14 <- select(SWC_14,1,7)
colnames(SWC_14) <- c("epoch", "Voltage")



swc <- rbind(SWC_1,SWC_2,SWC_3,SWC_4,SWC_5,SWC_6,SWC_7,SWC_8,SWC_9,SWC_10,SWC_11,SWC_12,SWC_13,SWC_14)
View(swc)
swc$date = (swc$epoch/86400)+25569
swc$date <- convertToDateTime(swc$date)
swc$date <- ymd_hms(swc$date)
View(swc)
#average to 1 min data
swc_min1 <- timeAverage(swc, avg.time = "1 min")
swc_min1$date =swc_min1$date - 4*60*60
View(swc_min1)
swc_min1$SWC = 100*(0.0003879*swc_min1$Voltage-0.6956)
swc_min <- select(swc_min1, date, SWC)
View(swc_min)
write.csv(swc_min, "Soil_water_Content_OVERVIEW_all_MANURRE_1_min_Processed_V3.csv", row.names = F)


#########################
#Soil Temperature

#set working directory
setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_30_data')


# Day 1

Temp_1 <- read.csv("FRMonitor_0123.log", sep = " ", header =F)
Temp_1 <- select(Temp_1,1,8)
colnames(Temp_1) <- c("epoch", "Celsius")
# Day 2
Temp_2 <- read.csv("FRMonitor_0124.log", sep = " ", header =F)
Temp_2 <- select(Temp_2,1,8)
colnames(Temp_2) <- c("epoch", "Celsius")

#Day 3
Temp_3 <- read.csv("FRMonitor_0125.log", sep = " ", header =F)
Temp_3<- select(Temp_3,1,8)
colnames(Temp_3) <- c("epoch", "Celsius")

#Day4 
Temp_4 <- read.csv("FRMonitor_0126.log", sep = " ", header =F)
Temp_4<- select(Temp_4,1,8)
colnames(Temp_4) <- c("epoch", "Celsius")

#Day 5 
Temp_5 <- read.csv("FRMonitor_0127.log", sep = " ", header =F)
Temp_5<- select(Temp_5,1,8)
colnames(Temp_5) <- c("epoch", "Celsius")

#Day 6 
Temp_6 <- read.csv("FRMonitor_0128.log", sep = " ", header =F)
Temp_6<- select(Temp_6,1,8)
colnames(Temp_6) <- c("epoch", "Celsius")

#Day 7
Temp_7 <- read.csv("FRMonitor_0129.log", sep = " ", header =F)
Temp_7<- select(Temp_7,1,8)
colnames(Temp_7) <- c("epoch", "Celsius")

#Day 8 
Temp_8 <- read.csv("FRMonitor_0130.log", sep = " ", header =F)
Temp_8<- select(Temp_8,1,8)
colnames(Temp_8) <- c("epoch", "Celsius")

#Day 9 
Temp_9 <- read.csv("FRMonitor_0131.log", sep = " ", header =F)
Temp_9<- select(Temp_9,1,8)
colnames(Temp_9) <- c("epoch", "Celsius")


#Day 10
Temp_10 <- read.csv("FRMonitor_0132.log", sep = " ", header =F)
Temp_10<- select(Temp_10,1,8)
colnames(Temp_10) <- c("epoch", "Celsius")

#Day11
Temp_11 <- read.csv("FRMonitor_0133.log", sep = " ", header =F)
Temp_11<- select(Temp_11,1,8)
colnames(Temp_11) <- c("epoch", "Celsius")

#Day 12
Temp_12 <- read.csv("FRMonitor_0134.log", sep = " ", header =F)
Temp_12<- select(Temp_12,1,8)
colnames(Temp_12) <- c("epoch", "Celsius")

#Day 13
Temp_13 <- read.csv("FRMonitor_0135.log", sep = " ", header =F)
Temp_13<- select(Temp_13,1,8)
colnames(Temp_13) <- c("epoch", "Celsius")

#Day 14
Temp_14 <- read.csv("FRMonitor_0136.log", sep = " ", header =F)
Temp_14<- select(Temp_14,1,8)
colnames(Temp_14) <- c("epoch", "Celsius")


Temp_all <- rbind(Temp_1,Temp_2,Temp_3,Temp_4,Temp_5,Temp_6,Temp_7,Temp_8,Temp_9,Temp_10,Temp_11, Temp_12,Temp_13,Temp_14)
Temp_all$date = (Temp_all$epoch/86400)+25569
Temp_all$date <- convertToDateTime(Temp_all$date)
Temp_all$date <- ymd_hms(Temp_all$date)
#average to 1 min data
Temp_all_1min<- timeAverage(Temp_all, avg.time = "1 min")
Temp_all_1min$date = Temp_all_1min$date - 4*60*60


write.csv(Temp_all_1min, "Soil_Temperature_Overview_all_MANURRE_1_min_Processed.csv", row.names = F)
######################################################
# PAR Sensor: 


#########################
#Soil Temperature

#set working directory
setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_30_data')

Air_temp_1 <- read.csv("FRMonitor_0123.log", sep = " ", header =F)
Air_temp_1 <- select(Air_temp_1,1,10)
colnames(Air_temp_1) <- c("epoch", "AirTemp")
#Day Fertilizer Day 2
Air_temp_2 <- read.csv("FRMonitor_0124.log", sep = " ", header =F)
Air_temp_2 <- select(Air_temp_2,1,10)
colnames(Air_temp_2) <- c("epoch", "AirTemp")

Air_temp_3 <- read.csv("FRMonitor_0125.log", sep = " ", header =F)
Air_temp_3<- select(Air_temp_3,1,10)
colnames(Air_temp_3) <- c("epoch", "AirTemp")

Air_temp_4 <- read.csv("FRMonitor_0126.log", sep = " ", header =F)
Air_temp_4<- select(Air_temp_4,1,10)
colnames(Air_temp_4) <- c("epoch", "AirTemp")

Air_temp_5 <- read.csv("FRMonitor_0127.log", sep = " ", header =F)
Air_temp_5 <- select(Air_temp_5,1,10)
colnames(Air_temp_5) <- c("epoch", "AirTemp")

Air_temp_6 <- read.csv("FRMonitor_0128.log", sep = " ", header =F)
Air_temp_6 <- select(Air_temp_6,1,10)
colnames(Air_temp_6) <- c("epoch", "AirTemp")

Air_temp_7 <- read.csv("FRMonitor_0129.log", sep = " ", header =F)
Air_temp_7<- select(Air_temp_7,1,10)
colnames(Air_temp_7) <- c("epoch", "AirTemp")

Air_temp_8 <- read.csv("FRMonitor_0130.log", sep = " ", header =F)
Air_temp_8<- select(Air_temp_8,1,10)
colnames(Air_temp_8) <- c("epoch", "AirTemp")

Air_temp_9 <- read.csv("FRMonitor_0131.log", sep = " ", header =F)
Air_temp_9 <- select(Air_temp_9,1,10)
colnames(Air_temp_9) <- c("epoch", "AirTemp")


Air_temp_10 <- read.csv("FRMonitor_0132.log", sep = " ", header =F)
Air_temp_10<- select(Air_temp_10,1,10)
colnames(Air_temp_10) <- c("epoch", "AirTemp")

Air_temp_11 <- read.csv("FRMonitor_0133.log", sep = " ", header =F)
Air_temp_11 <- select(Air_temp_11,1,10)
colnames(Air_temp_11) <- c("epoch", "AirTemp")

Air_temp_12 <- read.csv("FRMonitor_0134.log", sep = " ", header =F)
Air_temp_12<- select(Air_temp_12,1,10)
colnames(Air_temp_12) <- c("epoch", "AirTemp")

Air_temp_13 <- read.csv("FRMonitor_0135.log", sep = " ", header =F)
Air_temp_13 <- select(Air_temp_13,1,10)
colnames(Air_temp_13) <- c("epoch", "AirTemp"
                          )
Air_temp_14 <- read.csv("FRMonitor_0136.log", sep = " ", header =F)
Air_temp_14<- select(Air_temp_14,1,10)
colnames(Air_temp_14) <- c("epoch", "AirTemp")





Air_temp_all <- rbind(Air_temp_1,Air_temp_2,Air_temp_3,Air_temp_4,Air_temp_5,Air_temp_6,Air_temp_7,Air_temp_8,Air_temp_9,Air_temp_10,Air_temp_11,Air_temp_12,Air_temp_13,Air_temp_14)
Air_temp_all$date = (Air_temp_all$epoch/86400)+25569
Air_temp_all$date <- convertToDateTime(Air_temp_all$date)
Air_temp_all$date <- ymd_hms(Air_temp_all$date)
#average to 1 min data
Air_temp_all_1min<- timeAverage(Air_temp_all, avg.time = "1 min")
Air_temp_all_1min$date = Air_temp_all_1min$date - 4*60*60

Air_temp_all_1min$AirTemp = Air_temp_all_1min$AirTemp*20
View(PAR_all_1min)

write.csv(Air_temp_all_1min, "Air_temperature_Overview_all_MANURRE_1_min_Processed.csv", row.names = F)



setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_30_data')

PAR_1 <- read.csv("FRMonitor_0123.log", sep = " ", header =F)
PAR_1 <- select(PAR_1,1,5)
colnames(PAR_1) <- c("epoch", "PAR")
#Day Fertilizer Day 2
PAR_2 <- read.csv("FRMonitor_0124.log", sep = " ", header =F)
PAR_2 <- select(PAR_2,1,5)
colnames(PAR_2) <- c("epoch", "PAR")

PAR_3 <- read.csv("FRMonitor_0125.log", sep = " ", header =F)
PAR_3<- select(PAR_3,1,5)
colnames(PAR_3) <- c("epoch", "PAR")

PAR_4 <- read.csv("FRMonitor_0126.log", sep = " ", header =F)
PAR_4<- select(PAR_4,1,5)
colnames(PAR_4) <- c("epoch", "PAR")

PAR_5 <- read.csv("FRMonitor_0127.log", sep = " ", header =F)
PAR_5 <- select(PAR_5,1,5)
colnames(PAR_5) <- c("epoch", "PAR")

PAR_6 <- read.csv("FRMonitor_0128.log", sep = " ", header =F)
PAR_6 <- select(PAR_6,1,5)
colnames(PAR_6) <- c("epoch", "PAR")

PAR_7 <- read.csv("FRMonitor_0129.log", sep = " ", header =F)
PAR_7<- select(PAR_7,1,5)
colnames(PAR_7) <- c("epoch", "PAR")

PAR_8 <- read.csv("FRMonitor_0130.log", sep = " ", header =F)
PAR_8<- select(PAR_8,1,5)
colnames(PAR_8) <- c("epoch", "PAR")

PAR_9 <- read.csv("FRMonitor_0131.log", sep = " ", header =F)
PAR_9 <- select(PAR_9,1,5)
colnames(PAR_9) <- c("epoch", "PAR")
View(PAR_9)

PAR_10 <- read.csv("FRMonitor_0132.log", sep = " ", header =F)
PAR_10<- select(PAR_10,1,5)
colnames(PAR_10) <- c("epoch", "PAR")

PAR_11 <- read.csv("FRMonitor_0133.log", sep = " ", header =F)
PAR_11 <- select(PAR_11,1,5)
colnames(PAR_11) <- c("epoch", "PAR")

PAR_12 <- read.csv("FRMonitor_0134.log", sep = " ", header =F)
PAR_12<- select(PAR_12,1,5)
colnames(PAR_12) <- c("epoch", "PAR")

PAR_13 <- read.csv("FRMonitor_0135.log", sep = " ", header =F)
PAR_13 <- select(PAR_13,1,5)
colnames(PAR_13) <- c("epoch", "PAR")

PAR_14 <- read.csv("FRMonitor_0136.log", sep = " ", header =F)
PAR_14<- select(PAR_14,1,5)
colnames(PAR_14) <- c("epoch", "PAR")





PAR_all <- rbind(PAR_1,PAR_2,PAR_3,PAR_4,PAR_5,PAR_6,PAR_7,PAR_8,PAR_9,PAR_10,PAR_11,PAR_12,PAR_13,PAR_14)
PAR_all$date = (PAR_all$epoch/86400)+25569
PAR_all$date <- convertToDateTime(PAR_all$date)
PAR_all$date <- ymd_hms(PAR_all$date)
#average to 1 min data
PAR_all_1min<- timeAverage(PAR_all, avg.time = "1 min")
PAR_all_1min$date = PAR_all_1min$date - 4*60*60


write.csv(PAR_all_1min, "PAR_Overview_all_MANURRE_1_min_Processed.csv", row.names = F)




############
#Chamber Air temp
#Column 10 
# 1 Volt = 20 degrees, therefore dataframe$column10 = dataframe#column10 * 20


##########
#RH Data from Reference Chamber

#set working directory
setwd('/Users/yashar_iranpour/Desktop/R/HONO/chamber_28')


# Day 1

RH_1  <- read.csv("FRMonitor_0044.log", sep = " ", header =F)
RH_1  <- select(RH_1,1,6)
colnames(RH_1) <- c("epoch", "RH")
# Day 2
RH_2 <- read.csv("FRMonitor_0045.log", sep = " ", header =F)
RH_2 <- select(RH_2,1,6)
colnames(RH_2) <- c("epoch", "RH")

#Day 3
RH_3 <- read.csv("FRMonitor_0046.log", sep = " ", header =F)
RH_3<- select(RH_3,1,6)
colnames(RH_3) <- c("epoch", "RH")

#Day4 
RH_4 <- read.csv("FRMonitor_0047.log", sep = " ", header =F)
RH_4<- select(RH_4,1,6)
colnames(RH_4) <- c("epoch", "RH")

#Day 5 
RH_5 <- read.csv("FRMonitor_0048.log", sep = " ", header =F)
RH_5<- select(RH_5,1,6)
colnames(RH_5) <- c("epoch", "RH")

#Day 6 
RH_6 <- read.csv("FRMonitor_0049.log", sep = " ", header =F)
RH_6<- select(RH_6,1,6)
colnames(RH_6) <- c("epoch", "RH")

#Day 7
RH_7 <- read.csv("FRMonitor_0050.log", sep = " ", header =F)
RH_7<- select(RH_7,1,6)
colnames(RH_7) <- c("epoch", "RH")


#Day 8 
RH_8 <- read.csv("FRMonitor_0051.log", sep = " ", header =F)
RH_8<- select(RH_8,1,6)
colnames(RH_8) <- c("epoch", "RH")


#Day 9 
RH_9 <- read.csv("FRMonitor_0052.log", sep = " ", header =F)
RH_9<- select(RH_9,1,6)
colnames(RH_9) <- c("epoch", "RH")

#Day 10
RH_10 <- read.csv("FRMonitor_0053.log", sep = " ", header =F)
RH_10<- select(RH_10,1,6)
colnames(RH_10) <- c("epoch", "RH")




RH_all <- rbind(RH_1,RH_2,RH_3,RH_4,RH_5,RH_6,RH_7,RH_8,RH_9,RH_10)
RH_all$date = (RH_all$epoch/86400)+25569
RH_all$date <- convertToDateTime(RH_all$date)
RH_all$date <- ymd_hms(RH_all$date)
#average to 1 min data

RH_all_1min<- timeAverage(RH_all, avg.time = "1 min")
RH_all_1min$date = RH_all_1min$date - 4*60*60
RH_all_1min$RH = RH_all_1min$RH*20

write.csv(RH_all_1min, "RH_all_1min_MANURRE_V3.csv", row.names = F)
#######

