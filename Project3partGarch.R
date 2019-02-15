library(fGarch)


S0 <- 1630.287247


aff2 <- c(1624.778812,	1622.85355,	1623.325951,	1627.289469,	1628.395838)
bff2 <- c(1622.85355,	1623.325951,	1627.289469,	1628.395838,	1630.287247)
x2 <- aff2/bff2
x22 <-log(x2)

x222 <- x22[1] + x22[2] + x22[3] + x22[4] + x22[5] 

A0 <- 0.000001159
A <- 0.000001495
B <- 0.000026000
mean <- -0.000676907
std <- 0.001318695

Z <-pnorm(0.05, mean = 0, sd = 1) 

Sigma2 <- x222/Z
Sigma22 <-A0+A*X^2+B*Sigma2
Sk <- S0*(exp(x222))
Sk2 <- S0*(exp(x222)-1)


model = garchFit(formula = ~ garch(1, 1), data = dem2gbp, cond.dist = "norm", include.mean = TRUE)
fcst=predict(model,n.ahead=5)
mean.fcst=fcst$meanForecast