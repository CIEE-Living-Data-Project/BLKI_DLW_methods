########################################
# Script Title: Mock Project_LDP 20202
# Author: Fred Tremblauy
# Date created: 15 Sept 2022
# R version 4.2.1
#Date of last modification : 
########################################

#### LOAD DATA FROM DIRECTORY ####
getwd()
setwd("/Users/FredTremblay/Documents/Master/BIOL651/1-Prod&Reprod/Project/BLKI_DLW_methods/")

#reads black-legged kittiwake (BLKI) data collected on Middleton Island (MDO) in 2021
data <- read.csv("Data/Raw/BLKI_MDO_2021.csv")
#inspect raw data - will do some data cleaning and further varibale defining down the script
str(data)



#### LOAD PACKAGES USING GROUNDHOG() ####

#install.packages("groundhog") #install if you do not already have the package, otherwise skip this line
library(groundhog) #will ask for permission to store packages, just type 'Ok' when asked

#To load packages now, use 'groundhog.library' rather than 'library()' - need to provide a date at least 2 days past the first time you load the package
#this will store the package version and other relevant information regarding the packages used in a folder on your computer to allow tracability overtime

#groundhog.library(c("tidyverse","ggplot2"), date = "2022-08-31")
library(tidyverse)
    
#Add packages here as needed to run script

#Troubleshooting - if having issues with packages not loading - try running this line and then trying again
#groundhog:::load.cran.toc(TRUE)


#### DATA CLEANING ####
str(data)

#remove unnecessary columns for the analysis
data <- data [-c(1,4:7, 9:10,16:20)]

#confirm that there are only two levels to the 'Type' column and confimr number of indivudal ine ahc group
data %>%
  count(Type) #good, only two type: 24 x 1-sample and 25 x 2-sample

#confirm there are no repeats in the data sets - check unique individuals
data%>%
  count(Bird) #good no repeats

#write cleane data into new folder
write.csv(data, "/Users/FredTremblay/Documents/Master/BIOL651/1-Prod&Reprod/Project/BLKI_DLW_methods/Data/Cleaned/BLKI_MDO_2021_clean.csv")

