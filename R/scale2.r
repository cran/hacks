scale2<-function(x)
{
    if(!is.vector(x)) stop('x must be a vector')
    minx <- min(x, na.rm = TRUE)
    maxx <- max(x, na.rm = TRUE)
    (x - minx) / (maxx - minx)
}
