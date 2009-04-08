difference.sign.test <- function(x)
{
DNAME <- deparse(substitute(x))
n<-length(x)
METHOD <- "Difference-Sign Test (NULL:iid)"
X<-embed(x,2)
STATISTIC<-sum(X[,2] > X[,1])
mu <- (n-1)/2
sigma2 <- (n+1)/12
PVAL<-2*(1-pnorm(abs(STATISTIC-mu)/sqrt(sigma2)))
PARAMETER <- c(mu,sigma2)
names(STATISTIC) <- "normal"
names(PARAMETER) <- c("mu", "sigma2")
structure(list(statistic = STATISTIC, parameter = PARAMETER, 
        p.value = PVAL, method = METHOD, data.name = DNAME), 
        class = "htest")
}



