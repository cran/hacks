Title <- function(...)
{
    op <- par(no.readonly = TRUE)
    on.exit(par(op))
    par(mfrow = c(1, 1), xpd = NA)
    plot.window(c(0,1),c(0,1))
    title(...)
}
