library(itsmr)
library(tseries)
library(aTSA)
library(urca)
library(c)
library(forecast)

#values are taken for dates between 2018.01.11 - 2018.01.15 for testing until a finsihed code. Naive approach first of. Please check if dates used correspoeding to the data that should be used, did I choose the right k and t for the data?

St <- c(1623.325951,	1627.289469) #calculating St/St-1
St1 <- c(1627.289469,	1628.395838)

x <- log(St/St1)# these are the same values as the log-returns found on Quantlab,(they are so small values that you shoudl copy the whole table to excel ("Pre-estimate" with the "Table Series" tab) 
S0 <- 1630.287247 #define the log-return at S0 

x222 <- x[1] + x[2] 

(exp(x222)-1)
Sk <- S0*(exp(x222)-1)+S0 #calculate the Sk so the Sigma can be calculated later on

K <- length(aff) # K number of days
p <- 0.95
Z <- qnorm(p, mean = 0, sd = 1) # Z the standard normal random variable  
Sigma <- log(Sk-S0/S0+1)/(K*Z) # Sigma calculated
print(Sigma)



quantile(x222,  probs = c(0.05)) # On what should the quantiles be calculated on, I do not really get that
print

qqnorm(Sigma)
qqline(Sigma)
quantile(Sigma,  probs = c(0.05))

#for the B part with 5 days

aff2 <- c(1624.778812,	1622.85355,	1623.325951,	1627.289469,	1628.395838)
bff2 <- c(1622.85355,	1623.325951,	1627.289469,	1628.395838,	1630.287247)
x2 <- aff2/bff2
log(x2)

qqnorm(x2)
qqline(x2)
quantile(x2,  probs = c(0.05))

#GARCH

SigmaG <- x/Z
SigmaG2 <- 0,000001159
SKG <- S0*exp(x) # as Y=X thus u=0 assumption

Z <- dnorm(x, mean = 0, sd = 1)   

