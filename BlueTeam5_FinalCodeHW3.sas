/* importing aggregated data */
proc import file="\\vmware-host\Shared Folders\Desktop\Fall1TimeSeries2HW\aggdata.csv" out=work.tsdata;
run;

/* split the data, removing the last 6 months (to be used in the validation set) */
data work.tst;
set work.tsdata (obs=54);
run;

/* using proc arima to: 1. ADF test, 2. Ljung-Box Test for white noise, and 3. ACF/PACF graphs */
proc arima data=work.tsdata plot=all;
identify var=MonthlyMean nlag=10 stationarity=(adf=2);
estimate method=ML;
run;
quit;