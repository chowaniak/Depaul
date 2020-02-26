#DSC project


#import libraries
library(foreign)
library(corrplot)
library(car)
library(QuantPsyc)
library(leaps)
library(RColorBrewer)
library(Hmisc) 
library(psych)
library(ggplot2)
library(MASS)
library(reshape2)
library(RCurl)
library(tidyverse)
library(plyr)
library(caTools)


#family_data <- getURL("https://raw.githubusercontent.com/stfox13/DSC424FinalProject/master/family_modified_001.csv")
#family_df <- read.csv(text = family_data)
#View(family_df)




# Set the working directory
setwd("C:/Depaul_Win7/DSC 424 Advanced Data Analysis/Project/family")


#Read data
fam <- read.csv("familyxx.csv", sep=",", header=T)
dim(fam)
str(fam)
head(fam)

#FHICOST Cost of family medical/dental care in the past 12 months


#put FHICOST  in first column
fam <- fam[,c(119,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,120,121,122,123,124,125,126,127)]
str(fam)


#clean NAs
# check na after cleaning
sum(is.na(fam))


# #recode missing values -1 to NA
# fam[fam==-1] <-NA

#recode missing values 99 to NA
fam[fam==99] <-NA

#recode missing values 98 to NA
fam[fam==98] <-NA

#recode missing values 97 to NA
fam[fam==97] <-NA

#recode missing values 96 to NA
fam[fam==96] <-NA

#recode missing values 7 to NA
fam[fam==7] <-NA

#recode missing values 8 to NA
fam[fam==8] <-NA

#recode missing values 9 to NA
fam[fam==9] <-NA

#check for missing values
sum(is.na(fam))


#check which columns have the most NAs
map(fam,~sum(is.na(.)))


#drop variables which have too many NAs
#sum(is.na(fam$WRKCELN))
fam$WRKCELN = NULL #
fam$PHONEUSE = NULL #
fam$FM_EDUC1 = NULL # 
fam$FSSKIP = NULL #
fam$FSSKDAYS = NULL #
fam$FSLESS = NULL #
fam$FSHUNGRY = NULL #
fam$FSWEIGHT = NULL #
fam$FSNOTEAT = NULL #
fam$FSNEDAYS = NULL #
fam$FHDSTCT = NULL #
fam$FWRKLWCT = NULL #
fam$FCHLMYN = NULL #
fam$FSPEDYN = NULL #
fam$FCHLMCT = NULL #
fam$FSPEDCT = NULL #
fam$FGAH = NULL #
fam$FSNAPMYR = NULL #
fam$RAT_CAT4 = NULL #
fam$RAT_CAT5 = NULL #
fam$FWICYN = NULL #
fam$FWICCT = NULL #
fam$COVCONF = NULL #
fam$FMEDBNOP = NULL #
fam$FPRCOOH = NULL #
fam$FHIEBCCT = NULL #

#drop not importand variables
fam$RECTYPE = NULL #
fam$WTFA_FAM = NULL #
fam$FINT_Y_P = NULL #
fam$SRVY_YR = NULL #
fam$FMX = NULL #
fam$HHX = NULL #
fam$FINT_M_P = NULL #
fam$FINT_Y_P = NULL #


map(fam,~sum(is.na(.)))

#check NA by rows
fam[!complete.cases(fam),]

#remove rows which include NAs
famcleaned <- na.omit(fam) 

head(famcleaned)
dim(fam)
dim(famcleaned)

# check na after cleaning
sum(is.na(famcleaned))
#no NAs, 19800 rows, 101 columns

# not recognized as catergorical variable
is.factor(famcleaned$FHICOST)
# no dummy variables
#contrasts(famcleaned$FHICOST)


# bin FHICOST to low and high to use it in logistic regression
#low=0 - less then $500 per year, high=1 - more than $500 per year
#0 and 1 will be 0
#2, 3, 4, 5, will be 1

famcleaned$FHICOST[famcleaned$FHICOST==1]<- 0
famcleaned$FHICOST[famcleaned$FHICOST==0]<- 0
famcleaned$FHICOST[famcleaned$FHICOST==2]<- 1
famcleaned$FHICOST[famcleaned$FHICOST==3]<- 1
famcleaned$FHICOST[famcleaned$FHICOST==4]<- 1
famcleaned$FHICOST[famcleaned$FHICOST==5]<- 1

head(famcleaned)

plot(famcleaned$FHICOST)
hist(famcleaned$FHICOST, col="green")

sum(is.na(famcleaned))


# #create dataset with categorical variables only
# drop <-c("FM_SIZE","FM_KIDS","FM_ELDR","F10DVCT",
#   "FDMEDCT","FHCDVCT","FHCHMCT","FHCPHRCT",
#   "FHOSP2CT","FNMEDCT","FDGLWCT1","FDGLWCT2",
#   "FLIADLCT","FWKLIMCT",
#   "FWALKCT","FREMEMCT","FANYLCT","FHSTATEX",
#   "FHSTATVG","FHSTATG","FHSTATFR","FHSTATPR",
#   "FLAADLCT","FSALCT","FSEINCCT",
#   "FSSRRCT","FPENSCT","FOPENSCT","FSSICT",
#   "FTANFCT","FOWBENCT","FINTR1CT","FDIVDCT",
#   "FCHSPCT","FINCOTCT","FSSAPLCT","FSDAPLCT",
#   "FHIPRVCT","FHISINCT","FHICARCT",
#   "FHICADCT","FHICHPCT","FHIMILCT","FHIPUBCT",
#   "FHIOGVCT","FHIIHSCT","FHIEXCT","FHICOVCT")
# 
# 
# fam_cat=famcleaned[,!(names(famcleaned)%in%drop)]
# 


head(fam_cat)
dim(fam_cat)
#46 variables left, 19800 rows


famnum <- famcleaned[c('FHICOST','F10DVCT','FHCPHRCT','FDGLWCT2','FWKLIMCT','FHSTATEX',
                   'FHSTATPR','FSEINCCT','FSSICT','FDIVDCT','FSDAPLCT',
                   'FHICARCT','FHIPUBCT','FHICOVCT','FM_ELDR','FHCHMCT',
                   'FDGLWCT1','FLIADLCT','FANYLCT','FHSTATFR','FSALCT',
                   'FOPENSCT','FINTR1CT','FSSAPLCT','FHISINCT','FHIMILCT',
                   'FHIEXCT','FM_KIDS','FHCDVCT','FNMEDCT','FREMEMCT',
                   'FHSTATG','FLAADLCT','FPENSCT','FOWBENCT','FINCOTCT',
                   'FHIPRVCT','FHICHPCT','FHIIHSCT','FM_SIZE','FDMEDCT',
                   'FHOSP2CT','FWALKCT','FHSTATVG','FSSRRCT','FTANFCT',
                   'FCHSPCT','FHICADCT','FHIOGVCT')]
head(famnum)




#save famnum to csv 
write.csv(famnum,'famnum.csv')


#categorical
famcat <- famcleaned[c('FM_STRCP','FM_TYPE','FM_STRP','TELN_FLG',
                   'CURWRKN','TELCELN','FLNGINTV','F10DVYN','FDMEDYN',
                   'FHCDVYN','FHCHMYN','FHCPHRYN','FHOSP2YN','FNMEDYN',
                   'FSRUNOUT','FSLAST','FSBALANC','FLAADLYN','FLIADLYN',
                   'FWKLIMYN','FWALKYN','FREMEMYN','FANYLYN','HOUSEOWN',
                   'FSNAP','INCGRP4','INCGRP5','FSALYN','FSEINCYN','FSSRRYN',
                   'FPENSYN','FOPENSYN','FSSIYN','FTANFYN','FOWBENYN','FINTR1YN',
                   'FDIVDYN','FCHSPYN','FINCOTYN','FSSAPLYN','FSDAPLYN','FMEDBILL',
                   'FMEDBPAY','FSAF','FHICOVYN')]


#save famcleaned to csv to create dummy variables using Python
write.csv(famcat,'famcat.csv')




