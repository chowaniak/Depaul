#rmarkdown::render("C:/Depaul_Win7/DSC 425 Time Series/Final Project/DCS425projectadjustedGARCH.R", "pdf_document")


#DSC 425 Time Series Project 
#Michal Chowaniak



# Based on GarchIntel.R code by dr. John McDonald, DePaul University, 2019




#source("DSC425-Util.R")
#loadPkg("fBasics")
#loadPkg("zoo")
#loadPkg("forecast")
#loadPkg("ggplot2")
#loadPkg("TSA")
#loadPkg("tseries")

library(rmarkdown)
library(ggplot2)
library(tseries)
library(fBasics)
library(forecast)
library(lmtest)
library(fUnitRoots)
library(TSA)
library(zoo)
library(MASS)
options(scipen = 999) 


# Set the working directory
setwd("C:/Depaul_Win7/DSC 425 Time Series/Final Project")

# U.S. Census Bureau
# Source: Advance Monthly Sales for Retail and Food Services
# 44X72: Retail Trade and Food Services: U.S. Total
# Seasonally Adjusted Sales - Monthly [Millions of Dollars]
# Period: 1992 to 2018
# Data Extracted on: February 18, 2019 (10:30 pm)





ds <- read.csv("dataset/SeriesReport-201902182230.csv", 
                sep=",",
                header=T,
                blank.lines.skip=TRUE)

dim(ds)
head(ds)
tail(ds)


#Rename column names
names(ds)[1]=paste("date")
names(ds)[2]=paste("sale")
head(ds)


#recode date
#cens$date = as.Date(paste(cens$date, "-01",sep=""),format="%b-%Y-%d")
ds$date = as.Date(ds$date, format="%m/%d/%Y")
ds$date

dim(ds)
ds$sale

#check for NA
sum(is.na(ds$sale))

#create time series
#ds = ts(cens$sale, start=c(1992,1),frequency=12)




#Plot
plot(ds$date, ds$sale, type="l")



#no log transformaion
#census = ts(ds$sale, start=c(1992,1),frequency=12)
#plot(census)

#log transformation
census = ts(log(ds$sale), start=c(1992,1),frequency=12)
tail(census)
plot(census, main="Plot of Retail Sales log transformation")


#Compute the returns
r = diff(census)
r
plot(ds$date[-1], r, type="l", xlab="Year", main="Monthly Retail Sales log return")
hist(r)

skewness(r)
kurtosis(r)   #large excess kurtosis, not normal

#normality
jarque.bera.test(r)  #not normal, p-value less 0.05



#ARIMA -> overall trends

plot(census)
acf(census)     #slow decaying, looks like a non-stationary series
pacf(census)    #PACF is a random walk

loadPkg("fUnitRoots")
adfTest(census)    #p-value = 0.99, there is a unit root, 
#I can not reject hypothesis that series is nonstationary, it is non-stationary.

adfTest(census, type="c")  #p-value = 0.2588, there is a unit root, 
#after removing mean/trend series is still non stationary


#ACF for returns
acf(r) #something going on at lag 12,23
Box.test(r, lag = 5, type="Ljung") #p-value 0.4195
Box.test(r, lag = 12, type="Ljung") #p-value 0.0946
Box.test(r, lag = 23, type="Ljung")#p-value 0.43916
Box.test(r, lag = 25, type="Ljung") #p-value 0.1562
#cannot reject hypothesis of zero correlation
#there is no correlation between returns


eacf(census)    #Maybe an ARIMA(0, 1, 0) process

# AR/MA
#   0 1 2 3 4 5 6 7 8 9 10 11 12 13
# 0 x x x x x x x x x x x  x  x  x 
# 1 o o o o o o o o o o o  x  o  o 
# 2 x o o o o o o o o o o  x  o  o 
# 3 x x o o o o o o o o o  x  o  o 
# 4 x x x o o o o o o o o  x  o  o 
# 5 x x x o o o o o o o o  x  o  o 
# 6 x x x x o o o o o o o  x  o  o 
# 7 x o x x x o o o o o o  o  o  o 

#first line of X indicate a difference

eacf(r) #easf on differences ARIMA(0,1,0)

# AR/MA
#   0 1 2 3 4 5 6 7 8 9 10 11 12 13
# 0 o o o o o o o o o o o  x  o  o 
# 1 x o o o o o o o o o o  o  o  o 
# 2 x o o o o o o o o o o  o  o  o 
# 3 x o x o o o o o o o o  o  o  o 
# 4 o x x o o o o o o o o  o  o  o 
# 5 o x x x o o o o o o o  x  o  o 
# 6 o x x x x o o o o o o  o  o  o 
# 7 x o x x x o o o o o o  o  o  o


#fit
fit0 = Arima(census, order=c(0, 1, 0), include.drift=T)
fit0


# Series: census 
# ARIMA(0,1,0) with drift 
# 
# Coefficients:
#        drift
#       0.0035
# s.e.  0.0005
# 
# sigma^2 estimated as 0.00008794:  log likelihood=1051.22
# AIC=-2098.45   AICc=-2098.41   BIC=-2090.89


coeftest(fit0)  # The only significant term is drift 



# Let's see what residuals do
plot(fit0$residuals, type="l")
acf(fit0$residuals)  # there is some autocorrelation, at lag 24
Box.test(fit0$residuals, type="Ljung") #p-value 0.109
# cannot reject hypothesis of zero correlation, so no correlation between residuals 


#plot a forecast
plot(forecast(fit0, h=10), include=50)

# backtesting procedures using 90% (=290 values) 
# of the data for training and 10% for testing to evaluate
# the forecasting power of the fitted model.
source("backtest.R")
pm0=backtest(fit0, census, orig = 290,1)

# [1] "RMSE of out-of-sample forecasts"
# [1] 0.006656136
# [1] "Mean absolute error of out-of-sample forecasts"
# [1] 0.005059715
# [1] "Mean Absolute Percentage error"
# [1] 0.0003852395
# [1] "Symmetric Mean Absolute Percentage error"
# [1] 0.0003865715





#Auto ARIMA
loadPkg("forecast")
fit1 = auto.arima(census, allowdrift=T)
fit1   # auto.arima however does choose an ARIMA(0,1,0)(0,0,2)[12] with drift

# Series: census 
# ARIMA(0,1,0)(0,0,2)[12] with drift 
# 
# Coefficients:
#         sma1     sma2   drift
#       -0.1341  -0.1540  0.0035
# s.e.   0.0558   0.0577  0.0004
# 
# sigma^2 estimated as 0.00008477:  log likelihood=1057.77
# AIC=-2107.54   AICc=-2107.41   BIC=-2092.43

coeftest(fit1)


plot(fit1$residuals)                        
acf(fit1$residuals) #Shows no correlation
Box.test(fit1$residuals, lag=10, type="Ljung-Box") #p-value 0.1895
# cannot reject hypothesis of zero correlation, so no correlation between residuals 


# backtesting procedures using 90% (=290 values) 
# of the data for training and 10% for testing to evaluate
# the forecasting power of the fitted model.
source("backtest.R")
pm1=backtest(fit1, census, orig = 290,1)

# [1] "RMSE of out-of-sample forecasts"
# [1] 0.00666375
# [1] "Mean absolute error of out-of-sample forecasts"
# [1] 0.005118069
# [1] "Mean Absolute Percentage error"
# [1] 0.0003896825
# [1] "Symmetric Mean Absolute Percentage error"
# [1] 0.0003910283


acf(r)
plot(ds$date[-1], abs(r), type="l", xlab="Year", ylab="Absolute Returns")
acf(abs(r)) # shpws very little correlation of abs returns
plot(ds$date[-1], r*r, type="l", xlab="Year", ylab="Squared Returns")
acf(r*r) # does show correlation of squared returns at lag 1

##############################################################################################
# ARCH analysis
##############################################################################################

acf(r*r)        # significant correlation at lag 1
acf(abs(r))     # ignificant correlation at lag 1

pacf(abs(r))    # Looks like an autoregressive structure here!
pacf(r*r)       # There is something in lag 1


# First, we try a simple ARCH(1) model
archFit = garch(r, order=c(1, 1))  # Notice that the ARCH parameter is the second one here!
archFit
#a0 is constant
#a1 is alpha 1

resid = archFit$residuals[-1]  # The first residual is an NA!
plot(resid, type="l")  
plot(r, type="l")      # plot is bit more even


# And finally, we can run a prediction
predict(archFit, n.ahead=19, plot=T, nx=50)



##############################################################################################
# GARCH analysis - basic
##############################################################################################


# # Since both the ACF and PACF of r^2 do not have many terms, 
# #we will try a garch(0, 1)
# gfit = garch(r, order=c(1,1))  # defaults to a garch(1, 1)
# gfit
# 
# resid = gfit$residuals[-1]  # The first residual is an NA!
# plot(resid, type="l")  # Note how much more uniform this is ... but we still have
# # larger negative returns!  Note though that they are more
# # emphasized now.
# 
# skewness(resid)
# kurtosis(resid)   # Quite a bit less
# jarque.bera.test(resid)   # Still not normal though
# 
# acf(resid*resid)
# acf(abs(resid))     # Only one slight significance here
# 
# Box.test(resid*resid, type="Ljung-Box")  # Cannot reject white noise
# 
# # And finally, we can run a prediction
# predict(gfit, n.ahead=10, plot=T, nx=50)



####################################################################################
# A more powerful package with more options, "fGarch".  In particular, it allows us
# to include an ARIMA model in with the GARCH model so that we don't have to do it
# in two steps.
####################################################################################

loadPkg("fGarch")

gfit2 = garchFit(~ garch(1, 1), data=r, trace=F)
gfit2

# The properties of this kind of object are accessed with an @, not with a $
plot(gfit2@residuals, type="l")
jarque.bera.test((gfit2@residuals))

# Notice that these are the same as the original data because they are the
# residuals from the ARMA process and we didn't specify one!
plot(r)

# We could include an arma fit in the model with
gfit3 = garchFit(~ arma(0,2) + garch(1, 1), data=r, trace=F)
#gfit3 = garchFit(~ arma(0,0) + garch(1, 1), data=r, trace=F)
gfit3


#residual autocorrelation
acf(gfit3@residuals)
acf(gfit3@residuals^2)

#REsidual normality
jarque.bera.test((gfit3@residuals)) #not normal
jarque.bera.test((gfit3@residuals^2)) #not normal

#
Box.test(gfit3@residuals, lag=15, type="Ljung-Box") 
# ARMA(0,0) p-value 0.1515 cannot reject hypothesis of zero correlation, so no correlation between residuals 
# ARMA(0,2) p-value 0.001865 can reject hypothis of zero correlation, os there is correlation

Box.test(gfit3@residuals^2, lag=15, type="Ljung-Box") 
# ARMA(0,0) #p-value 0.0.00000006392, can reject hypothesis of zero correlation, so there is  correlation between residuals 
# ARMA(0,2) 0.000000000000004774, can reject hypothesis of zero correlation, so there is  correlation between squared residuals 




# This only shifts them slightly
plot(gfit3@residuals, type="l")

# Now, let's look at the squared residuals and the estimated volatility
plot(gfit3@residuals^2, type="l")
lines(gfit3@h.t, col="red")

# We can limit the y-axis to see the volatility estimate better
plot(gfit3@residuals^2, type="l", ylim=c(0, .01))
lines(gfit3@h.t, col="red")

# We can scale the residuals with the standard deviation (sqrt(volatility)) 
# and get a graph similar to the residuals from the last GARCH modeler
plot(gfit3@residuals / sqrt(gfit2@h.t), type="l")


# And finally, we can run a prediction

predict(gfit3, n.ahead=5, plot=T, nx=100)


predict(gfit3, n.ahead=1)

f = predict(gfit3, n.ahead=1)

f$meanForecast[1]
str(gfit3@formula)

testLen = floor(length(r) * .98)
testLen


summary(garchFit(gfit3@formula, data=r[1:testLen], trace=F))
summary(garchFit(~ arma(1, 1) + garch(1, 1), data=r, trace=F))

source("BacktestGarch.R")


backtestGarch(gfit3, r, testLen, 1)

#warnings()









