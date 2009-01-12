\name{ciplot}
\alias{ciplot}
\title{Confidence Interval Plot}
\description{
Draws a dotplot with line segments representing upper
and lower confidence bounds.  This function is loosely
based on \code{dotchart}.
}
\usage{
ciplot(x, labels = NULL, cex = par("cex"), 
col = par('col'), xlim = range(x[is.finite(x)]), 
main = NULL, xlab = NULL, ylab = NULL, \ldots) 
}
\arguments{
  \item{x}{a three column matrix where the columns
  represent the lower confidence limit, the point 
  estimate, and the upper confidence limit (in that 
  order).}
  \item{labels}{a vector of labels for each point.  If
  NULL then \code{rownames(x)} is used.}
  \item{cex}{the magnification value.}
  \item{col}{the color used for the points and the
  confidence intervals.}
  \item{xlim}{the x limits of the plot.}
  \item{main}{a main title for the plot.}
  \item{xlab}{a label for the x axis.}
  \item{ylab}{a label for the y axis.}
  \item{\ldots}{additional graphic parameters.}
}
\author{Nathan Stephens}
\seealso{
  \code{\link{dotchart}}, \code{\link{points}}, \code{\link{segments}}.
}
\examples{
require(stats)
data(chickwts)
xx <- summary(lm(weight ~ feed, chickwts))$coef
yy<-xx[, 1] + 1.96 * cbind(lcl = -xx[, 2],est = 0, ucl = xx[, 2])
ciplot(yy)
}
\keyword{hplot}

