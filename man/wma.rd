\name{wma}
\alias{wma}
\title{Weighted Moving Average}
\description{
Calculates a weighted moving average for a given vector
or matrix.
}
\usage{
wma(x, w = 1, stdz = TRUE)
}
\arguments{
   \item{x}{a numeric vector or matrix.}
   \item{w}{weight value in (0, 1].}
   \item{stdz}{should the weights sum to one?  If
   \code{FALSE} then the output resembles a weighted
   moving sum (see \code{Details}).} 
}
\details{
This function calculates a weighted moving average where the
first element or row represents the starting time period and 
the last element or row represents the ending time period.  The 
unstandardized weights are calculated as \code{wt[i,j] = w^(i-j)}.
If \code{stdz = TRUE} then the weights are standardized such that
the weights for each column sum to one.
}
\value{
A matrix where each row represents the weighted average of it
and all preceding rows.
}
\author{Nathan Stephens}
\examples{
wma(1:10,0.5)
}
\keyword{array}
\keyword{math}

