rbnorm<-function(n = 1, sigx = 1, sigy = 1, 
    rho = 0, mux = 0, muy = 0)
{
    covxy <- rho * sigx * sigy
    vars <- c(sigx^2, covxy, covxy, sigy^2)
    X <- matrix(rnorm(2 * n, 0, 1), n, 2)
    A <- chol(matrix(vars, 2, 2))
    b <- matrix(c(mux, muy), n, 2, byrow = TRUE)
    X %*% A + b
}

