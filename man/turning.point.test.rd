\name{turning.point.test}
\alias{turning.point.test}
\title{Turning Point Test for Checking iid Hypothesis}
\description{
'turning.point.test' is a non-parametric test, used to test the null hypothesis that the input are values of independent and identically distributed random variables. We say that there is a turning point at time \code{i}, \code{1<i<n}, if \code{y_{i-1}<y_i} and \code{y_i>y_{i+1}} or if \code{y_{i-1} > y_i} and \code{y_i < y_{i+1}}.  
}
\usage{
turning.point.test(x)
}
\arguments{
   \item{x}{a vector or a time series object.}
}
\references{
     Brockwell and Davis (2002) \emph{Introduction to Time Series and Forecasting}. Chapter 1. 
     New York: Springer.
          }

\author{Vicky Yang}
\seealso{
   \code{\link{difference.sign.test}}, \code{\link{rank.test}}
}
\examples{
# sequence with dependency 
x <- arima.sim(n = 150, list(ar = c(0.889)))
turning.point.test(x)

# iid sequence
turning.point.test(rnorm(200))
}
\keyword{math}
