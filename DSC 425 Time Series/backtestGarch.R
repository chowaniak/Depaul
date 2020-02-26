"backtestGarch" <- function(m1,rt,orig,h,xre=NULL,fixed=NULL,inc.mean=TRUE, inc.drift=FALSE){
  # m1: is a time-series model object
  # orig: is the starting forecast origin
  # rt: the time series
  # xre: the independent variables
  # h: forecast horizon
  # fixed: parameter constraint
  # inc.mean: flag for constant term of the model.
  # inc.drift: flag for drift term of the model (only for differenced TS).
  #
  form = m1@formula
  T=length(rt)
  if(orig > T) orig=T
  if(h < 1) h=1
  rmse=rep(0,h)
  mabso=rep(0,h)
  mape=rep(0,h)
  smape=rep(0,h)
  nori=T-orig
  err=matrix(0,nori,h)
  fcast=matrix(0, nori,h)
  obs=matrix(0, nori,h)
  sumerr=matrix(0,nori,h)
  jlast=T-1
  for (n in orig:jlast){
    jcnt=n-orig+1
    x=rt[jcnt:n]
    if ((n - orig) %% 10 == 0) 
    {
      str = sprintf("Testing %d of %d\n", (n - orig), (jlast - orig))    
      print(str)
    }
    mm=garchFit(form, data = x, trace=F)
    fore = predict(mm, n.ahead=h)

    kk=min(T,(n+h))
    # nof is the effective number of forecats at the forecast origin n.
    nof=kk-n
    pred=fore$meanForecast[1:nof]
    obsd=rt[(n+1):kk]
    obs[jcnt,1:nof]=obsd
    fcast[jcnt,1:nof]=pred
    err[jcnt,1:nof]=obsd-pred
    sumerr[jcnt,1:nof]=abs(obsd)+abs(pred)
  }
  #
  for (i in 1:h){
    iend=nori-i+1
    tmp=err[1:iend,i]
    mabso[i]=mean(abs(tmp))
    rmse[i]=sqrt(mean(tmp^2))
    mape[i]=mean(abs(tmp/obs))
    smape[i]=mean(abs(tmp)/(sumerr/2))
    
  }

  
  print("RMSE of out-of-sample forecasts")
  print(rmse)
  print("Mean absolute error of out-of-sample forecasts")
  print(mabso)
  print("Mean Absolute Percentage error")
  print(mape)
  print("Symmetric Mean Absolute Percentage error")
  print(smape)
  backtest <- list(origin=orig,obs=obs,error=err,forecast=fcast,rmse=rmse,mabso=mabso, mape=mape)
}
