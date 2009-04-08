turning.point.test <- function(x)
{
DNAME <- deparse(substitute(x))
n<-length(x)
METHOD <- "Turning Point Test (NULL:iid)"
X<-embed(x,3)
STATISTIC<-sum((X[,2] > X[,1] & X[,2] > X[,3])|(X[,2] < X[,1] & X[,2] < X[,3]))
mu <- 2*(n-2)/3
sigma2 <- (16*n-29)/90
PVAL<-2*(1-pnorm(abs(STATISTIC-mu)/sqrt(sigma2)))
PARAMETER <- c(mu,sigma2)
names(STATISTIC) <- "normal"
names(PARAMETER) <- c("mu", "sigma2")
structure(list(statistic = STATISTIC, parameter = PARAMETER, 
        p.value = PVAL, method = METHOD, data.name = DNAME), 
        class = "htest")
}


