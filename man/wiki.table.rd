\name{wiki.table}
\alias{wiki.table}
\title{Format Wiki Tables}
\description{
Formats a matrix or a data frame for a wiki article.
}
\usage{
wiki.table(x,caption=deparse(substitute(x)),...)
}
\arguments{
   \item{x}{a matrix or a data frame.}
   \item{caption}{a character string or \code{NULL}.  If \code{NULL}
     no caption is printed.  The default is the object name.}
   \item{...}{parameter values for inclusion in the wiki header.
     These should be in the form of \code{parameter = value}.} 
}
\details{
This format is used in WikiMedia tables.
}
\author{Nathan Stephens}
\examples{
wiki.table(matrix(1:9,3),caption=NULL)
wiki.table(VADeaths,border=1,cellspacing=0,cellpadding=5,align="center")
apply(Titanic,3:4,wiki.table)
}
\keyword{data}
\keyword{datasets}

