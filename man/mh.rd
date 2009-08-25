\name{mh}
\alias{mh}
\title{Metropolis Hastings Algorithm}
\description{
Computes random variables from an unnormalized distribution using 
the Metropolis Hastings algorithm.
}
\usage{
mh(FUN, n = 10000, mean = 0, sd = 1)
}
\arguments{
   \item{FUN}{a function desribing the unnormalized distribution.}
   \item{n}{the number of iterations to perform.}
   \item{mean}{The initial value for computing the random variables.
   This is the mean of the proposal distribution.}
   \item{sd}{The standard deviation of the proposal distribution.}
}
\details{
This implementation of the Metropolis Hastings algorithm uses the
normal distribution for the prosal distribution.}
\author{Nathan Stephens}
\examples{
set.seed(2037)
f <- function(x) 0.1*((1+(x-10)^2)/3)^-2
x <- mh(f)
par(mfrow=c(2,1))
plot(density(x), main = 'Normalized Distribution')
plot(x,type='l', main = 'Sampled Values')
}
\keyword{math}
\keyword{distribution}

