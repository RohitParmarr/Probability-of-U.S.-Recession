# install.packages('quantmod')
library(quantmod)

# https://fred.stlouisfed.org/series/T10Y3M
# 10-yr-3-Month treasurey spread
getSymbols("T10Y3M",src="FRED")
barChart(T10Y3M)

library(fpp2)
library(fpp)
library(urca)

kpss <- ur.kpss(T10Y3M)
summary(kpss)

kpss_diff <- ur.kpss(diff(T10Y3M))
summary(kpss_diff)

ndiffs(T10Y3M)

auto_arima <- auto.arima(T10Y3M)
auto_ar1 <- Arima(T10Y3M, order=c(1,0,0))
auto_ar1_diff1 <- Arima(T10Y3M, order=c(1,1,0))

auto_arima_forecast <- forecast(auto_arima, h=365)
auto_ar1_forecast <- forecast(auto_ar1, h=365)
auto_ar1_diff1_forecast <- forecast(auto_ar1_diff1, h=365)


ggAcf(T10Y3M)

# Strong AR(1)
ggPacf(T10Y3M)

# AR(1)

# ACF and PACF of the differenced data

ggAcf(diff(T10Y3M))

ggPacf(diff(T10Y3M))


auto_arima_fit <- auto.arima(T10Y3M)
plot(forecast(auto_arima_fit, h=365))

ar1_fit <- Arima(T10Y3M, order=c(1,0,0))
plot(forecast(ar1_fit, h=365))





