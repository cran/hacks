mh <- function(FUN, n = 10000, mean = 0, sd = 1)
{
    out <- numeric(n)
    out[1] <- mean
    FUN <- match.fun(FUN)
    for(i in 2:n){
        qual <- out[i-1]
	cand <- rnorm(1, qual, sd)
        k <- dnorm(cand, qual, sd) / dnorm(qual, qual, sd)
	alph <- min(FUN(cand) / FUN(qual) * k, 1)
        if(runif(1) < alph) qual <- cand
        out[i] <- qual
    }
    out
}

