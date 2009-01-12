ciplot <- function (x, labels = NULL, cex = par("cex"), 
    col = par('col'), xlim = range(x[is.finite(x)]),
    main = NULL, xlab = NULL, ylab = NULL, ...) 
{
    opar <- par("cex", "mai", "yaxs")
    on.exit(par(opar))
    par(cex = cex, yaxs = "i")
    if (!(is.numeric(x) & (NCOL(x) == 3))) 
        stop("'x' must be a three column matrix")
    n <- nrow(x)
    if (is.null(labels))
        labels <- rownames(x)
    if (is.null(labels))
        labels <- as.character(pretty(1:n))
    else
        labels <- rep(labels, length.out = n)
    labpos <- seq(labels)
    plot.new()
    linch <- max(strwidth(labels, "inch"), na.rm = TRUE)
    nmai <- par("mai")
    nmai[2] <- nmai[4] + linch + 0.1
    par(mai = nmai)
    y <- 1:n
    ylim <- c(0, n + 1)
    plot.window(xlim = xlim, ylim = ylim, log = "")
    lheight <- par("csi")
    loffset <- (linch + 0.2)/lheight
    mtext(labels, side = 2, line = loffset, at = labpos, 
        adj = 0, las = 2, cex = cex, ...)
    segments(x[,1],y,x[,3],y, col = col, ...)
    points(x[,2], y, col = col, ...)
    axis(1)
    axis(2, at = labpos, labels = FALSE)
    box()
    title(main, xlab, ylab, ...)
}

