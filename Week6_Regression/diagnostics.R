# dependencies
library(plyr)
library(dplyr)
library(car)
library(lmtest)

# load data
dat <- read.csv("World3_subset.csv")[,-1]

# fit model
mod <- lm(HDI ~ ., dat)

# look for collinearity
pairs(dat)

# Assumption 1 - Expectation is 0
# If violated, we assume x_j on E(Y) when it is not
plot(cbind(residuals(mod), dat[,5:10]), lower.panel = NULL)

# Component residual plots (partial residual plots)
# Use 'car' package
crPlots(mod)

# Assumption 2 - constant variance
# Common issue is dependence of residuals on E(Y)
plot(fitted(mod), residuals(mod), xlab="Fitted", ylab="Residuals")
abline(h= c(-2,0,2), lwd = c(2,2,2), col=c("red", "red", "red"), lty = c(2,1,2))

plot(fitted(mod), abs(residuals(mod)), xlab="Fitted", main ="|Residuals|")

summary(lm(abs(residuals(mod)) ~ fitted(mod)))

# bptest(p) does the Breuch Pagan test to formally 
# check presence of heteroscedasticity. Low p-value
# indicates higher prob of heteroscedasticity.
bptest(mod)


# Assumption 3 - Normality of errors
# qqplot
qqnorm(residuals(mod), ylab="Residuals")
qqline(residuals(mod), col = "red", lwd = 2)
# histogram
hist(residuals(mod), breaks=50)

# Assumption 4 - Uncorrelated Errors
# Typical in time-series data. If errors are correlated, more advanced methods will
# come into play. Correlation may help us!
plot(residuals(mod))
acf(residuals(mod))
pacf(residuals(mod))



