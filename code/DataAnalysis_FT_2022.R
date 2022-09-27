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
install.packages("ggsignif")
library(ggsignif)

#### DEE vs DLW methods ####

DEE<- ggplot(data, aes(x = Type, y = DEE.kJ.d, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("Energy Expenditure (kJ/g*d)") + xlab("DLW sampling method") + 
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

ggsave("Outputs/Figure_1.png", DEE)


#### TIME_ACTIVITY_BUDGET VS METHODS #####
library(car)
library(emmeans)
library(gridExtra)
str(data)

fly <- ggplot(data, aes(x = Type, y = propFlycal, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("") + xlab("DLW sampling method") + 
  ggtitle("Flying") + theme(legend.position = "none") +
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

swim <- ggplot(data, aes(x = Type, y = propSwimcal, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("") + xlab("DLW sampling method") + 
  ggtitle("Swiming") + theme(legend.position = "none") +
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

glide <- ggplot(data, aes(x = Type, y = propSoarcal, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("") + xlab("DLW sampling method") + 
  ggtitle("Gliding") + theme(legend.position = "none") +
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

rest <- ggplot(data, aes(x = Type, y = propRestcal, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("") + xlab("DLW sampling method") + 
  ggtitle("Resting") + theme(legend.position = "none") +
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

col <- ggplot(data, aes(x = Type, y = propColcal, fill = Type)) + geom_boxplot() + theme_bw() +
  ylab("") + xlab("DLW sampling method") + 
  ggtitle("Colony") + theme(legend.position = "none") +
  scale_fill_manual(values = c("grey", "tan")) +
  geom_signif(comparisons = list(c("2-sample", "1-sample")), map_signif_level=TRUE) 

TAB <- grid.arrange(col,swim,fly, rest, glide, ncol=5)
ggsave("Outputs/Figure_2.png", TAB)

