\name{rank.test}
\alias{rank.test}
\title{Rank Test for Checking iid Hypothesis}
\description{
'rank.test' is a non-parametric test, used to test the null hypothesis that the input are values of independent and identically distributed random variables. It is particularly useful for detecting a linear trend in the data.  
}
\usage{
rank.test(x)
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
   \code{\link{difference.sign.test}}, \code{\link{turning.point.test}}
}
\examples{
# sequence with dependency 
x <- arima.sim(n = 150, list(ar = c(0.889)))
rank.test(x)

# iid sequence
rank.test(rnorm(200))
}
\keyword{math}
