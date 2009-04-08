\name{scale2}
\alias{scale2}
\title{Scale a vector into [0, 1]}
\description{
Scales a vector into numbers between zero and one.
}
\usage{
scale2(x)
}
\arguments{
   \item{x}{A numeric vector.}
}
\details{
This function subtracts the minimum from the vector and then divides by the range of the vector.  The result is a vector with a minimum of zero and a maximum of one.  Missing values are ignored.
}
\author{Nathan Stephens}
\seealso{
   \code{\link{scale}}
}
\examples{
scale2(rivers)
}
\keyword{arith}
\keyword{manip}

