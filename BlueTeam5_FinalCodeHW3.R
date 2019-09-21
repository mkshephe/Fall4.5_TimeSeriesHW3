library(tseries)
library(ggplot2)
library(forecast)
library(ggfortify)
setwd("/Users/michaelzabawa/Documents/GitHub/Fall1TimeSeries2HW")
rawData <- read.csv("aggdata.csv")
load("trainDataTimeSeriesHW2.RDA")
load("testDataTimeSeriesHW2.RDA")

acfTest <- acf(trainData$MonthlyMean)
pacfTest <- pacf(trainData$MonthlyMean)

adf.test(trainData$MonthlyMean, k  = 3)

autoplot(acfTest)+
  theme_classic() +
  geom_hline(yintercept = 0)+
  scale_color_brewer(palette = "Paired")+
  labs(title = "Autocorrelation Function (ACF)", 
       subtitle = "With 95% Confidence Interval", 
       x = "Lag", 
       y = "ACF") +
  theme(legend.title=element_blank(), 
        text = element_text(size = 14), 
        plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

autoplot(pacfTest)+
  theme_classic() +
  geom_hline(yintercept = 0)+
  scale_color_brewer(palette = "Paired")+
  labs(title = "Partial Autocorrelation Function (PACF)", 
       subtitle = "With 95% Confidence Interval", 
       x = "Lag", 
       y = "PACF") +
  theme(legend.title=element_blank(), 
        text = element_text(size = 14), 
        plot.title = element_text(hjust = .5),
        plot.subtitle = element_text(hjust = .5))

for(i in 1:20){
  print(Box.test(trainData$MonthlyMean,lag = i, type = "Ljung-Box")$p.value)
}



