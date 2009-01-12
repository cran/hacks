polyprep <- function(x1, x2 = NULL){
    if(is.null(x2)) x2 <- x1
    if(!is.vector(x1) | !is.vector(x2)) 
        stop('inputs must be vectors')
    if(length(x1) != length(x2))
        stop('unequal vector lengths')
    dd <- cbind(x1,x2)
    na <- apply(is.na(dd),1,any)
    dd <- dd * ifelse(na, NA, 1)
    ind <- 1:nrow(dd)
    rownames(dd) <- ind
    grp <- c(1, cumsum(abs(diff(na))) + 1)
    FUNx <- function(x) c(dd[x, 1], rev(dd[x, 2]))
    y <- tapply(ind, grp, FUNx)
    unlist(unname(y))
}
