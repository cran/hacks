rank.test <- function(x)
{
DNAME <- deparse(substitute(x))
n<-length(x)
METHOD <- "Rank Test (NULL:iid)"
STATISTIC<-0
for(i in 1:(n-1))
  for(j in i:n)
   if(x[j]>x[i]) STATISTIC<-STATISTIC+1
mu <- n*(n-1)/4
sigma2 <- n*(n-1)*(2*n+5)/72
PVAL<-2*(1-pnorm(abs(STATISTIC-mu)/sqrt(sigma2)))
PARAMETER <- c(mu,sigma2)
names(STATISTIC) <- "normal"
names(PARAMETER) <- c("mu", "sigma2")
structure(list(statistic = STATISTIC, parameter = PARAMETER, 
        p.value = PVAL, method = METHOD, data.name = DNAME), 
        class = "htest")
}


