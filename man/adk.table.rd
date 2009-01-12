\name{adk.table}
\alias{adk.table}
\title{Cross Tabulation and Frequency Summary}
\description{
'adk.table' uses the 'table' function in R to build a contingency table 
of the counts at each factor level. It also shows the percentage and 
cumulative percentages for that level.
}
\usage{
adk.table(x,digits=NULL)
}
\arguments{
   \item{x}{a vector or a factor.}
   \item{digits}{integer indicating the percision to be used.}
}
\author{Vicky Yang}
\seealso{
   \code{\link{table}}, \code{\link{cumsum}}
}
\examples{
b <- factor(rep(c("A","B","C"), 3))
adk.table(b,3)
}
\keyword{array}
\keyword{manip}

