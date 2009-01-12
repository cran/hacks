AGG <- function(x, by, FUN, ...)
{
    if (!is.data.frame(x))
        x <- as.data.frame(x)
    if (!is.list(by))
        stop("'by' must be a list")
    if (is.null(names(by)))
        names(by) <- paste("Group", seq_along(by), sep = ".") 
    else {
        nam <- names(by)
        ind <- which(!nzchar(nam))
        names(by)[ind] <- paste("Group", ind, sep = ".")
    }
    by0 <- by
    byname <- names(by)
    xname <- names(x)
    by <- matrix(unlist(lapply(by, matrix, ncol = 1)), ncol = length(by), 
    byrow = FALSE)
    id <- apply(!is.na(by), 1, all)
    by <- by[id, ]
    x <- as.data.frame(x[id, ])
    if(NCOL(by) == 1) 
        by2 <- by 
    else
        by2 <- apply(by, 1, paste, collapse = '|')
    y.cal <- lapply(x, tapply, by2, FUN, ..., simplify = FALSE)
    if (any(sapply(unlist(y.cal, recursive = FALSE), length) > 1L))
        stop("'FUN' must always return a scalar")
    w <- matrix(unlist(strsplit(unlist(dimnames(y.cal[[1L]])), '\\|')),
        nrow = dim(y.cal[[1L]]), ncol = NCOL(by), byrow = TRUE)
    w2 <- as.data.frame(w)
    for(i in 1:ncol(w)){
        w2[, i] = by0[[i]][match(w[, i], as.factor(by0[[i]]))]
    }
    y <- matrix(unlist(y.cal), ncol = length(y.cal), byrow = FALSE)
    y <- data.frame(w2, y, stringsAsFactors = FALSE)
    names(y) <- c(byname, xname)
    row.names(y) <- NULL
    y
}




