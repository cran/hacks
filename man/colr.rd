\name{colr}
\alias{colr}
\title{Create Transparent Colors}
\description{
Convert colors from the R color palette index to a hexidecimal string.  This function is primarily used to add transparencies to the color palette.
}
\usage{
colr(col.pal = 1, a = 1)
}
\arguments{
   \item{col.pal}{An integer 'i' referring to the color palette index (typically 1-8).}
   \item{a}{Numeric value in [0,1] that specifies the alpha channel.} 
}
\author{Nathan Stephens}
\seealso{
   \code{\link{rgb}}, \code{\link{col2rgb}}
}
\examples{
colr() # Black
colr(4,0.5) # Blue at half transparency
}
\keyword{color}

