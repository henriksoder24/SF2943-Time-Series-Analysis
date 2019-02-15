library(itsmr)
library(forecast)
library(tseries)

data <- read.csv("candy_production.csv")[[2]]
ts <- tsclean(ts(data, c(1972,1),c(2017,8), frequency=12))
ts <- window(ts, c(1976,1),c(1996,12), frequency=12)
plot(ts, main="US Candy Production", xlab = "", ylab = "")
lines(trend(ts, 1), type = 'l', col = 'red')
axis(1, cex = 2)
axis(2, cex = 2)
mtext("% Production from 2012", side=2, line=2.2, cex=1.3)
mtext("Year", side = 1, line = 2.2, cex = 1.3)

acf(ts, lag.max = 40, main="Autocorrelation Function", xlab = " ", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Autocorrelation", side = 2, line = 2.2, cex = 1.3)

pacf(ts, lag.max = 40, main="Partial Autocorrelation Function", xlab = "", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Partial Autocorrelation", side = 2, line = 2.2, cex = 1.3)

nsdiffs(ts)
ndiffs(ts)

clean <- ts - season(ts, 12) - trend(ts-season(ts, 12), 1) 
tsdisplay(clean, main = "TS after removal of linear trend and season with period 12", lag.max = 40)

acf(clean, lag.max = 40, main="Autocorrelation Function", xlab = " ", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Autocorrelation", side = 2, line = 2.2, cex = 1.3)

pacf(clean, lag.max = 40, main="Partial Autocorrelation Function", xlab = "", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Partial Autocorrelation", side = 2, line = 2.2, cex = 1.3)

plot(clean, main="US Candy Production - Without Trend & Seasonality", xlab = "", ylab = "")
abline(h = 0)
axis(1, cex = 2)
axis(2, cex = 2)
mtext("% Production from 2012", side=2, line=2.2, cex=1.3)
mtext("Year", side = 1, line = 2.2, cex = 1.3)

nsdiffs(clean)
ndiffs(clean)

model_data <- window(clean, c(1976,1), c(1995,12))
holdout <- window(clean, c(1996,1), c(1996,12))

fit <- Arima(model_data, order = c(13,0,0))
fit
par(mfrow = c(2,2))
acf(fit$fitted)
pacf(fit$fitted)
acf(fit$x)
pacf(fit$x)

fit <- Arima(model_data, order = c(13,0,0), fixed = c(NA, 0, NA, 0, NA, 0, 0, 0, NA, NA, NA, NA, NA, 0), transform.pars = FALSE)
fit

plot(fit$residuals, main = "US Candy Production - Residuals", ylab="", xlab="")
abline(h = 0)
mtext("% Production from 2012", side=2, line=2.2, cex=1.3)
mtext("Year", side = 1, line = 2.2, cex = 1.3)

test(fit$residuals)

qqnorm(fit$residuals, main = "Residuals - Normal Q-Q Plot", cex.lab = 1.5)
qqline(fit$residuals)


acf(fit$residuals, lag.max = 40, main="Autocorrelation for Residuals", xlab = " ", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Autocorrelation", side = 2, line = 2.2, cex = 1.3)

pacf(fit$residuals, lag.max = 40, main="Partial Autocorrelation for Residuals", xlab = "", ylab = "")
mtext("Lag in Years", side = 1, line = 2.2, cex = 1.3)
mtext("Partial Autocorrelation", side = 2, line = 2.2, cex = 1.3)

plot(forecast(fit, level=95, h=12), main="Residuals with Forecasts for Jan-Dec 1996")
lines(holdout)
mtext("Year", side = 1, line = 2.2, cex = 1.3)
mtext("Residual % Production of 2012", side = 2, line = 2.2, cex = 1.3)
legend(1983, 13.5, c("Original Data", "Forecast"), lty = c(1,1), col = c("black", "blue"))

