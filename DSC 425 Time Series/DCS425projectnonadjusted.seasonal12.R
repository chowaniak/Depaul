
#rmarkdown::render("C:/Depaul_Win7/DSC 425 Time Series/Final Project/DCS425projectnonadjustedGARCH.R")
#rmarkdown::render("C:/Depaul_Win7/DSC 425 Time Series/Final Project/DCS425projectnonadjustedGARCH.R", "pdf_document")


#DSC 425 Time Series Project 
#Michal Chowaniak

#############################################
#                                           #
#                                           #  
#         non adjusted dataset              #
#                                           #
#                                           #
#############################################



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
# Non Seasonally Adjusted Sales - Monthly [Millions of Dollars]
# Period: 1992 to 2018
# Data Extracted on: February 18, 2019 (10:30 pm)


ds <- read.csv("dataset/NonAdjusted_Sales.csv", 
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
ds$date = as.Date(ds$date, format="%d/%m/%Y")
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
plot(census)




#Compute the returns
#r = diff(census)
r = diff(census) 
acf(r)# there is a big spike at lag 12

# second indicator of seasonality is row of x in easf of differences
eacf(r)
# AR/MA
# 0 1 2 3 4 5 6 7 8 9 10 11 12 13
# 0 x x o o x x x o o x x  x  x  x 
# 1 x x o o o o x o o o x  x  x  x 
# 2 x x o o x o o o o o x  x  x  x 
# 3 x x x x x o x o o o o  x  x  x 
# 4 x x x x x o o o o o o  x  x  x 
# 5 x x x x x o o o o o o  x  x  x 
# 6 x o x x o x o o o o o  x  x  o 
# 7 x o x x o o o x o o o  x  x  o 


# seasonality is 12, than difference by 12 r, which is already differenced
r1 = diff(r,12)
acf(r1) # big seasonality at lag1 , but there are others too ??


fit = arima(r, order=c(0,0,13), fixed=c(0,NA,NA,0,0,0,0,0,0,0,NA,NA,NA,NA))
fit
coeftest(fit)  #MA12 significant



loadPkg("fUnitRoots")
adfTest(r1)    #p-value = 0.01 , it is statioanry
#I can reject hypothesis that series is nonstationary, it is stationary.


skewness(r1)
kurtosis(r1)   #small excess kurtosis, it is normal

#normality
jarque.bera.test(r1)  #p-value is 0.2126 is normal


Box.test(r1, lag = 25, type="Ljung") #p-value 0.00000000000000022
#reject hypothesis of zero correlation, 
#there is correlation


#residuals


# Let's see what residuals do
plot(fit$residuals, type="l")
acf(fit$residuals)  # there is some autocorrelation, at lag 24
Box.test(fit$residuals, type="Ljung") #p-value 
# can reject hypothesis of zero correlation, so there is some correlation between residuals



predict(fit)

#plot a forecast
plot(forecast(census, h=100), include=50)


source("backtest.R")
pm1=backtest(fit, census, orig = 290,1)

# [1] "RMSE of out-of-sample forecasts"
# [1] 0.065693
# [1] "Mean absolute error of out-of-sample forecasts"
# [1] 0.05528395
# [1] "Mean Absolute Percentage error"
# [1] 0.004171569
# [1] "Symmetric Mean Absolute Percentage error"
# [1] 0.00422616




#########################################################

# seasonal arima

# ARIMA(0,1,13)[12]


########################################################


# fit on 1 difference
#fit1=arima(r, order=c(0,1,13))

#fit on 12 differnce
#fit1=arima(census, order=c(0,1,13))

#fit on original non adjusted time series
fit1=arima(census, order=c(0,1,13))

fit1 
coeftest(fit1)


loadPkg("fUnitRoots")
adfTest(r1)    #p-value = 0.01 , it is statioanry
#I can reject hypothesis that series is nonstationary, it is stationary.

skewness(r1)
kurtosis(r1)   #small excess kurtosis, it is normal

#normality
jarque.bera.test(r1)  #p-value is 0.2126 is normal


Box.test(r1, lag = 25, type="Ljung") #p-value 0.00000000000000022
#reject hypothesis of zero correlation, 
#there is correlation


#residuals
plot(fit1$residuals, type="l")
acf(fit1$residuals)  # there is some autocorrelation, at lag 24
Box.test(fit1$residuals, type="Ljung") #p-value 0.1909
tsdiag(fit1) 



#predict
predict(fit1,12)
f1=predict(fit1,12)
names(f1)
f1


#plot a forecast

plot(forecast(census, h=50), include=100)


source("backtest.R")
pm1=backtest(fit1, census, orig = 290,1)

# [1] "RMSE of out-of-sample forecasts"
# [1] 0.04615719
# [1] "Mean absolute error of out-of-sample forecasts"
# [1] 0.03729883
# [1] "Mean Absolute Percentage error"
# [1] 0.002814463
# [1] "Symmetric Mean Absolute Percentage error"
# [1] 0.002849621








