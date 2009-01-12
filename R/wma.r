wma<-function(x, w = 1, stdz = TRUE)
{
    if(!is.numeric(x))
        stop('x must be numeric')
    if(w > 1 | w <= 0)
        stop('w must be in (0,1]')
    x <- as.matrix(x)
    n <- nrow(x)
    W <- w^outer(1:n, 1:n, '-')
    W <- W * lower.tri(diag(n), diag = TRUE)
    if(stdz) W <- W / apply(W, 1, sum)
    W %*% x
}

