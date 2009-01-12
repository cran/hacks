\name{rbnorm}
\alias{rbnorm}
\title{Bivariate normal generator}
\description{
Generates random observations from the bivariate normal distribution.
}
\usage{
rbnorm(n = 1, sigx = 1, sigy = 1, 
    rho = 0, mux = 0, muy = 0)
}
\arguments{
   \item{n}{number of observations.}
   \item{sigx}{standard deviation of x.} 
   \item{sigy}{standard deviation of y.}
   \item{rho}{correlation x and y.}
   \item{mux}{mean of the x.}
   \item{muy}{mean of the y.}
}
\author{Nathan Stephens}
\seealso{
   \code{\link{rnorm}}, \code{\link{chol}}
}
\examples{
set.seed(6501)
xx <- rbnorm(1000, 17, 29, 0.7)
sd(xx) # 16.85128 30.13945
cor(xx)[2,1] # 0.7235906
}
\keyword{datagen}
\keyword{distribution}

