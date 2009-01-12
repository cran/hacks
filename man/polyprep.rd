\name{polyprep}
\alias{polyprep}
\title{Plot polygons with missing data}
\description{
Formats data with missing values to be plotted
with the \code{polygon} function.
}
\usage{
polyprep(x1, x2 = NULL)
}
\arguments{
  \item{x1}{a numeric vector.}
  \item{x2}{an optional second vector. If unspecified,
  it will be set equal to \code{x1}.}
}
\details{
\code{polyprep} is designed to be used in conjuction 
with \code{polygon} when missing values are found in
the data.  The default behavior is to split \code{x1}
into pieces at each occurance of missing values, then
combine these pieces with the reverse of \code{x2}, and
then reassembled the pieces back into a single vector.
}
\author{Nathan Stephens}
\seealso{
  \code{\link{polygon}}, \code{\link{split}}.
}
\examples{
y <- c(LakeHuron)
y <- ifelse(y > 580, NA, y-min(y))
yy <- polyprep(y, -y)
xx <- as.numeric(names(yy))
plot(xx, yy, type = 'n')
polygon(xx, yy, col = 2)
}
\keyword{dplot}

