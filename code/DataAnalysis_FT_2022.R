########################################
# Script Title: Mock Project_LDP 2022_DataAnalysis
# Author: Fred Tremblauy
# Date created: 20 Sept 2022
# R version 4.2.1
#Date of last modification : 
########################################

### LOAD DATA FROM DIRECTORY ####
setwd("/Users/FredTremblay/Documents/Master/BIOL651/1-Prod&Reprod/Project/BLKI_DLW_methods/")

#read cleaned black-legged kittiwake (BLKI) data collected on Middleton Island (MDO) in 2021 
data <- read.csv("Data/Cleaned/BLKI_MDO_2021_clean.csv")
#inspect raw data
str(data)

#### DOWNLOAD LIBRARIES ####

#libraries will be download using 'library()' rather than 'groudhog()' to avoid messing other scripts
library(ggplot2)

#### PLOT 1: DEE vs DLW methods ####

ggplot(data, aes(x = Type, y = DEE.kJ.d, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("Energy Expenditure (kJ/g*d)") + xlab("DLW sampling method") + 
  scale_fill_manual(values = c("grey", "tan")) +
  
  
