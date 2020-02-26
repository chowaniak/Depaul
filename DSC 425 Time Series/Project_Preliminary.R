#DSC 425 Time Series Project 
#Dominick Amalraj
#Preliminary Analysis

library("fBasics")
library("zoo")
library("forecast")
library("TSA")

setwd("C:/Users/damalraj/Documents")
ds = read.csv("Seasonal_data.csv")
ds
#remove rows over 327
ds = ds[-which(ds$Period == ""),]
ds
ds_TS1 = ts(ds$Value, frequency=1)   
ds_TS1
plot(ds_TS1, ylab="Rate",main="Production Index")

acf(ds$Period, main="ACF Plot of Time Series")
pacf(ds$Period, main="PACF Plot of Time Series")
eacf(df$Period)

Box.test(ds$Period, lag=10, type='Ljung', fitdf=8)
