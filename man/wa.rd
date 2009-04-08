\name{wa}
\alias{wa}
\title{Weighted Average}
\description{
Calculates a weighted average for a given vector.
}
\usage{
wa(x, w = 1, stdz = TRUE)
}
\arguments{
   \item{x}{a numeric vector.}
   \item{w}{weight value in (0, 1].}
   \item{stdz}{should the weights sum to one?  If 
   \code{FALSE} then the output resembles a weighted
   sum (see \code{Details}).} 
}
\details{
This function calculates a weighted average where the
first element represents the starting time period and 
the last element represents the ending time period. The
unstandardized weights are calculated as \code{wt[i] = w^(n-i)}.
If \code{stdz = TRUE} then the weights are standardized so
that they sum to one.}
\author{Nathan Stephens}
\examples{
wa(1:10,0.5)
}
\keyword{math}

