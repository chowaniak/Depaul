#DSC 425 Time Series Project 
#Michal Chowaniak
#Preliminary Analysis

loadPkg("fBasics")
loadPkg("zoo")
loadPkg("forecast")

library(tseries)
library(fBasics)
library(forecast)
library(lmtest)

# Set the working directory
setwd("C:/Depaul_Win7/DSC 425 Time Series/Final Project")


cens <- read.csv("dataset/SeriesReport-201902182230.csv", 
                sep=",",
                header=T,
                blank.lines.skip=TRUE
                )
cens
dim(cens)
head(cens)
tail(cens)

#Remove column #3
#cens = cens[-c(3)]

#Rename column names
names(cens)[1]=paste("date")
names(cens)[2]=paste("sale")


#remove rows over 327
#cens = cens[-which(cens$date == ""),]

#recode date
#cens$date = as.Date(paste(cens$date, "-01",sep=""),format="%b-%Y-%d")
cens$date = as.Date(cens$date, format="%m/%d/%y")
cens$date

dim(cens)
cens$sale

sum(is.na(cens$sale))

#convert to numeric

# cens[,2]
# cens[,2] <- as.numeric(as.character(cens[,2]))
# 
# 
# 
# sale= as.numeric(cens$sale)
# 
# 
# sale
# cens$sale
# 
# typeof(sale)
# typeof(cens$sale)
# sale[1]
# cens$sale[1]

#create time series
ts1 = ts(cens$sale, start=c(1992,1),frequency=12)





#### returns ?????



# Summary statistics
basicStats(ts1)
plot(decompose(ts1))
plot(decompose(ts1, "additive"))

# Initial plots
plot(ts1)
hist(ts1, xlab="Retail and Food services", prob=TRUE, main="Histogram")
hist(ts1)

# trends
trend = ma(ts1, order = 4, centre=T)
plot(ts1)
lines(trend)

# add approximating normal density curve
xfit<-seq(min(ts1),max(ts1),length=40)
yfit<-dnorm(xfit,mean=mean(ts1),sd=sd(ts1))
lines(xfit, yfit, col="blue", lwd=2)

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
acf(ts1, plot=T, lag=100)
acf(ts1, lag=20)
pacf(ts1,plot=T)


#check for stationarity, build AR model and check for phi1
#if greater or equal to 1 model is not stationary.


m1= arima(ts1, order=c(1,0,0), method='ML', include.mean=T)
m1

coeftest(m1)


#how likely it is the trend is caused by random walk?
# how likely it is phi1 paramenter comes from stackastic process?


















