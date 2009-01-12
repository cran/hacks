\name{Title}
\alias{Title}
\title{Create a Device Title}
\description{
Creates a title for the graphical device.  This function is useful for adding
overall titles on layouts described by the \code{mfrow} or \code{mfcol} 
graphical parameters.
}
\usage{
Title(\ldots)
}
\arguments{
   \item{\ldots}{arguments passed to \code{title}.}
}
\author{Nathan Stephens}
\seealso{
   \code{\link{title}}
}
\examples{
par(mfrow=c(2,2))
for(i in 1:4){
    plot(airquality[,i],type='l')
    title(names(airquality)[i],line=0.5)
}
Title('Air Quality',cex.main=2,line=3)
}
\keyword{aplot}

