\name{AGG}
\alias{AGG}
\title{Compute summary statistics of data with many subsets}
\usage{
AGG(x, by, FUN, \dots)
}
\description{
  Splits the data into subsets, computes summary statistics for each,
  and returns the result in a convenient form.	This function is based on
  the \code{aggregate} function in R, but uses a single dimension for the
  grouping variable instead of multiple dimensions.
}
\arguments{
  \item{x}{a data frame.}
  \item{by}{a list of grouping elements, each as long as the variables
    in \code{x}.}
  \item{FUN}{a scalar function to compute the summary statistics which
    can be applied to all data subsets.}
  \item{\dots}{further arguments passed to or used by methods.}
}
\details{
Unlike \code{aggregate}, the \code{AGG} function requires that \code{x}
be a data frames. If \code{x} is not a data frame, it is coerced to one. 
Next, combinations of the components of \code{by} are pasted together to 
form a single vector of labels. Then, each of the columns in \code{x} is 
split into subsets, and \code{FUN} is applied to each such subset with 
further arguments in \code{\dots} passed to it.  

The reason we do this is that the original procedure of handling the problem 
in \code{aggregate} becomes extremely slow, when the number of unique 
combinations in \code{by} is small, but the number of possible combinations 
is large. Empty subsets are removed, and the result is reformatted into a data
frame containing the variables in \code{by} and \code{x}.  Those arising 
from \code{by} contain the unique combinations of grouping values used for 
determining the subsets, and the ones arising from \code{x} the corresponding
summary statistics for the subset of the respective variables in \code{x}.  
Rows with missing values in any of the \code{by} variables will be omitted 
from the result.
}
\value{
A data frame with columns corresponding to the grouping variables in
\code{by} followed by aggregated columns from \code{x}.  If the \code{by}
has names, the non-empty times are used to label the columns in the
results, with unnamed grouping variables being named \code{Group.\var{i}}
for \code{by[[\var{i}]]}.
}
\author{Vicky Yang}
\seealso{
  \code{\link{aggregate}}, \code{\link{apply}}, \code{\link{lapply}}, \code{\link{tapply}}.
}
\examples{
x<-1:10
by<-c(rep("a",2),rep("b",4),rep("c",4))
AGG(x,list(by),sum)

by<-CO2[,1:3]
x<-CO2[,4:5]
aggregate(x,by,sum)
AGG(x,by,sum)

AGG(state.x77, list(Region = state.region), mean)
}
\keyword{array}
