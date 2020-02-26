#DSC 425 Time Series Project 
#Michal Chowaniak
#Preliminary Analysis
#Exploratory Analysis HW3 question 2

loadPkg("fBasics")
loadPkg("zoo")
loadPkg("forecast")

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





cens <- read.csv("dataset/SeriesReport-201902182230.csv", 
                sep=",",
                header=T,
                blank.lines.skip=TRUE
                )
cens
dim(cens)
head(cens)
tail(cens)


#Rename column names
names(cens)[1]=paste("date")
names(cens)[2]=paste("sale")
head(cens)


#recode date
#cens$date = as.Date(paste(cens$date, "-01",sep=""),format="%b-%Y-%d")
cens$date = as.Date(cens$date, format="%m/%d/%y")
cens$date

dim(cens)
cens$sale

#check for NA
sum(is.na(cens$sale))

#create time series
ts1 = ts(cens$sale, start=c(1992,1),frequency=12)


# Summary statistics
basicStats(ts1)
plot(decompose(ts1))
plot(decompose(ts1, "additive"))

# Initial plots
plot(ts1, main="Monthly Sales Adjusted")

#histogram
hist(ts1, breaks = 5, las = 2, main="Histogram Retail and Food services Adjusted")
hist(ts1, main="Histogram Retail and Food services Adjusted")

#density
hist(ts1, xlab="Retail and Food services", prob=TRUE, main = "Density" )
lines(density(ts1))


# add approximating normal density curve

hist(ts1, las =2, breaks = 5, prob=T)
xfit<-seq(min(ts1),max(ts1),length=40)
yfit<-dnorm(xfit,mean=mean(ts1),sd=sd(ts1))
lines(xfit, yfit, col="blue", lwd=2)


# trends
trend = ma(ts1, order = 4, centre=T)
plot(ts1)
lines(trend)


#normal probability test amd plot

normalTest(ts1, method = 'jb')

qqnorm(ts1)
qqline(ts1, col = 2) 

#time plot
plot(ts1, type='l', xlab='months', ylab='Monthly change')

# 3. Analysis of any non-stationary behavior, trends or seasonality in the series


#Ljung box test for independence of white noise
Box.test(ts1,lag=6,type='Ljung')




# 4. ACF, PACF and EACF computations
acf(ts1, plot=T, lag=12)
acf(ts1, lag=20)
pacf(ts1,plot=T)


#check for stationarity, build AR model and check for phi1
#if greater or equal to 1 model is not stationary.


m1= arima(ts1, order=c(1,0,0), method='ML', include.mean=T)
m1

coeftest(m1)


#how likely it is the trend is caused by random walk?
# how likely it is phi1 paramenter comes from stackastic process?





######### Exloratory model #################
# Problem 2 [10 points] (Individual Submission) 
# Based on the results of problem 1, each team member should build an exploratory model. 
# If possible, try to explore different aspects of the series. 
# Each of the team members should separately do the following 


plot(ts1)

#check ACF PACF 
acf(ts1, plot=T, lag=100)
acf(ts1, lag=20)
pacf(ts1,plot=T)

adfTest(ts1, lags=3, type=c("c"))
adfTest(ts1, lags=3, type=c("nc"))
adfTest(ts1, lags=3, type=c("ct"))
# I can not rejest hypothesis that seires is nonstationary, p-value is larger then 0.05



# series is non stationary so apply difference
diffts1 = diff(ts1)
plot(diffts1)
acf(diffts1, plot=T, lag=100, main="ACF of differences")
acf(diffts1, lag=20, main="ACF of differences")
pacf(diffts1,plot=T)

eacf(diffts1)


# 1. Run a Dickey-Fuller test, there are three versions of this test, 
# so each member should try a different version of this test. 
# If you have more than 3 participants, then you should try get related series 
# that you can test as well. 


adfTest(diffts1, lags=3, type=c("c"))
adfTest(diffts1, lags=3, type=c("nc"))
adfTest(diffts1, lags=3, type=c("ct"))

# I can reject hypothesis that series is nonstationary, 
#so it is stationary series, p-value is 0.01




# 2. Based on the initial results from problem 1, 
# run an initial model for one of the series in your set. 
# You can choose any order ARIMA (or GARCH or other models
# if you want to read ahead ???) that you want, 
# but each member should try a different model. 

#seasonal.test = "seasonal unit root tests"
#autoarima
#model3= auto.arima(ts1, trace=T, D=1)
model3= auto.arima(ts1, trace=T)
model3

#Best model: ARIMA(0,1,0)(0,0,2)[12] with drift 

coeftest(model3)


#(1,1,1)
model1 = Arima(ts1, order=c(1,1,1), include.drift=T)
model1
coeftest(model1)



# 3. Run the full set of diagnostics on your model as we have done
# in the homeworks including checking for normality 
# and white-noise residuals and run an appropriate backtest. 


#Best model: ARIMA(0,1,0)(0,0,2)[12] with drift 

#Residual analysis
tsdiag(model3) 
acf(model3$residuals)
#no residual error


# Ljung box test on residuals
Box.test(model3$residuals, 6, "Ljung-Box") 
Box.test(model3$residuals, 12, "Ljung-Box") 
#we cannot reject hypothesis that this is white noise, p-value was 0.6495


#Histogram
hist(residuals(model3))

#normality
qqnorm(residuals(model3)) 
qqline(residuals(model3), col = 2)


#predictions
forecast(model3, h=20)
plot(forecast(model3, h=20))


#backtesting
source("backtest.R")
length(ts1)
window = length(ts1) * .8
window
pm1 = backtest(model3, ts1, window, 1)

