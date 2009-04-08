\name{difference.sign.test}
\alias{difference.sign.test}
\title{Difference-Sign Test for Checking iid Hypothesis}
\description{
'difference.sign.test' is a non-parametric test, used to test the null hypothesis that the input are values of independent and identically distributed random variables. We count the number of values of \code{i} such that \code{y_i > y_{i-1}} or the other way around.  
}
\usage{
difference.sign.test(x)
}
\arguments{
   \item{x}{a vector or a time series object.}
}
\references{
    Brockwell and Davis (2002) \emph{Introduction to Time Series and Forecasting}. Chapter 1. 
    New York: Springer.
          }
\note{
  "The differnce-sign test must be used with caution. A set of observations exhibiting a strong cyclic component will pass the  
  difference-sign test for randomness, since roughly half of the observations will be points of increase."
}
\author{Vicky Yang}
\seealso{
   \code{\link{turning.point.test}}, \code{\link{rank.test}}
}
\examples{
# sequence with dependency 
x <- arima.sim(n = 150, list(ar = c(0.889)))
difference.sign.test(x)

# iid sequence
difference.sign.test(rnorm(200))
}
\keyword{math}
