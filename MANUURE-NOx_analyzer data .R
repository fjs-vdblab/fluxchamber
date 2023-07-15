library(openair)
library(lubridate)
library(dplyr)

#tidy up R, remove old dataframes
rm(list = ls())

setwd('/Users/yashar_iranpour/Desktop/R/HONO/NOx_data/09')

eco20230308.txt 65 kb 
eco20230307.txt 125 kb
eco20230306.txt 62 kb
eco20230305.txt 125 kb
eco20230304.txt 125 kb
eco20230303.txt 125 kb


NOx_1 <- read.csv("eco20230303.txt")
View(NOx_1)

NOx_2 <-read.csv("eco20230304.txt")

NOx_3 <-read.csv("eco20230305.txt")
View(NOx_3)
NOx_4 <- read.csv("eco20230306.txt")
View(NOx_4)

NOx_5 <-read.csv("eco20230307.txt")
View(NOx_5)
NOx_6 <-read.csv("eco20230308.txt")

#Sep 5th, 2022 
NOx_4 <-read.csv("Minion_Sep_5th_Manuure.csv")

#Sep 6th, 2022 

NOx_5 <- read.csv ("")

#Sep7th, 2022 

#Sep8th, 2022 

#Sep 9th, 2022 


NO_x_all <- rbind(NOx_1,NOx_2,NOx_3)
View(NO_x_all)

#write csv, change file name!!
write.csv(NO_x_all, "Minion NOx_Mannure_Sep_2-4.csv")



###This file came from an edited csv file called "Minion NOx_Manuure_Sep_2-4.csv"
Minion_sep2_4 <-read.csv("Minion_sep_2_4_2022.csv")


colnames(NOx_4)  <- c("date", "NO", "NO2", "NOx", "O3")
NOx_4$date <- ymd_hms(NOx_4$date)

View(NOx_4)

timePlot(NOx_4, poll = c("NO","NO2", "O3"), ylab = "mixing ratio (ppb)", 
         main = "Minion NOx Analyzer Sep 5th, 2022")

##Filter timeplot to whatever date you like using the Start and Stop times in YYYY-MM-DD. Make sure Excel has defined the columns as datetime. 
timePlot(selectByDate(Minion_sep2_4, start = "2022-09-04", end = "2022-09-04"), poll = c("NO","NO2", "NOx", "O3"), ylab = "mixing ratio (ppb)", 
         main = "Minion Nox analyzer Sep 2 - 4, 2022")

