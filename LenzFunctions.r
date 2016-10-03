findmean<-function(x){mean(x)}

findAbove<-function(x,n){
  above<-x>n
  x[above]
}

cc
#print(cc$nobs)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
#print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)

cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))


iris[iris$Species=='virginica',]

iris

?iris

lapply(iris[iris$Species=='virginica',],mean)
apply(iris, 1, mean)


set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)


outcome[, 11] <- as.numeric(outcome[, 11])
 ## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

names(outcome)