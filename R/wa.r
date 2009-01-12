wa<-function(x, w = 1, stdz = TRUE)
{
    if(!is.vector(x))
        stop('x must be a vector')
    if(w > 1 | w <= 0)
        stop('w must be in (0,1]')
    w <- w ^ c(length(x) : 1 - 1)
    if(stdz) w <- w / sum(w)
    sum(x * w)
}    

