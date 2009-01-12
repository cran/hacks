\name{heatmap2}
\alias{heatmap2}
\title{Annotated Heatmap}
\description{
  This function is a slight modification of \code{heatmap}. Two lines
  of code have been added that superimpose labels onto the heatmap.
}
\usage{
heatmap2(x, Rowv=NULL, Colv=if(symm)"Rowv" else NULL,
	distfun = dist, hclustfun = hclust,
        reorderfun = function(d,w) reorder(d,w),
        add.expr, symm = FALSE, revC = identical(Colv, "Rowv"),
	scale=c("row", "column", "none"), na.rm = TRUE,
	margins = c(5, 5), ColSideColors, RowSideColors,
	cexRow = 0.2 + 1/log10(nr), cexCol = 0.2 + 1/log10(nc),
	labRow = NULL, labCol = NULL, main = NULL,
        xlab = NULL, ylab = NULL,
        keep.dendro = FALSE, verbose = getOption("verbose"), 
        digits = NULL, col = par("col"), cex = par("cex"), 
        font = par("font"), \dots)
}
\arguments{
  \item{x}{numeric matrix of the values to be plotted. }
  \item{Rowv}{determines if and how the \emph{row} dendrogram should be
    computed and reordered.  Either a \code{\link{dendrogram}} or a
    vector of values used to reorder the row dendrogram or
    \code{\link{NA}} to suppress any row dendrogram (and reordering) or
    by default, \code{\link{NULL}}, see \sQuote{Details} below.}
  \item{Colv}{determines if and how the \emph{column} dendrogram should be
    reordered.	Has the same options as the \code{Rowv} argument above and
    \emph{additionally} when \code{x} is a square matrix, \code{Colv =
      "Rowv"} means that columns should be treated identically to the rows.}
  \item{distfun}{function used to compute the distance (dissimilarity)
    between both rows and columns.  Defaults to \code{\link{dist}}.}
  \item{hclustfun}{function used to compute the hierarchical clustering
    when \code{Rowv} or \code{Colv} are not dendrograms.  Defaults to
    \code{\link{hclust}}. Should take as argument a result of \code{distfun}
    and return an object to which \code{\link{as.dendrogram}} can be applied.}
  \item{reorderfun}{function(d,w) of dendrogram and weights for
    reordering the row and column dendrograms.  The default uses
    \code{\link{reorder.dendrogram}}.}
  \item{add.expr}{expression that will be evaluated after the call to
    \code{image}.  Can be used to add components to the plot.}
  \item{symm}{logical indicating if \code{x} should be treated
    \bold{symm}etrically; can only be true when \code{x} is a square matrix.}
  \item{revC}{logical indicating if the column order should be
    \code{\link{rev}}ersed for plotting, such that e.g., for the
    symmetric case, the symmetry axis is as usual.}
  \item{scale}{character indicating if the values should be centered and
    scaled in either the row direction or the column direction, or
    none.  The default is \code{"row"} if \code{symm} false, and
    \code{"none"} otherwise.}
  \item{na.rm}{logical indicating whether \code{NA}'s should be removed.}
  \item{margins}{numeric vector of length 2 containing the margins
    (see \code{\link{par}(mar= *)}) for column and row names, respectively.}
  \item{ColSideColors}{(optional) character vector of length \code{ncol(x)}
    containing the color names for a horizontal side bar that may be used to
    annotate the columns of \code{x}.}
  \item{RowSideColors}{(optional) character vector of length \code{nrow(x)}
    containing the color names for a vertical side bar that may be used to
    annotate the rows of \code{x}.}
  \item{cexRow, cexCol}{positive numbers, used as \code{cex.axis} in
    for the row or column axis labeling.  The defaults currently only
    use number of rows or columns, respectively.}
  \item{labRow, labCol}{character vectors with row and column labels to
    use; these default to \code{rownames(x)} or \code{colnames(x)},
    respectively.}
  \item{main, xlab, ylab}{main, x- and y-axis titles; defaults to none.}
  \item{keep.dendro}{logical indicating if the dendrogram(s) should be
    kept as part of the result (when \code{Rowv} and/or \code{Colv} are
    not NA).}
  \item{verbose}{logical indicating if information should be printed.}
  \item{digits}{integer indicating the precision to be used for the labels.
    The default, \code{NULL}, is to not use rounding.}
  \item{col, cex, font}{the color, magnification, and font used for the labels.}
  \item{\dots}{additional arguments passed on to \code{\link{image}},
    e.g., \code{col} specifying the colors.} %
}
\details{
  If either \code{Rowv} or \code{Colv} are dendrograms they are honored
  (and not reordered).	Otherwise, dendrograms are computed as
  \code{dd <- as.dendrogram(hclustfun(distfun(X)))} where \code{X} is
  either \code{x} or \code{t(x)}.

  If either is a vector (of \sQuote{weights}) then the appropriate
  dendrogram is reordered according to the supplied values subject to
  the constraints imposed by the dendrogram, by \code{\link{reorder}(dd,
    Rowv)}, in the row case.
  %%
  If either is missing, as by default, then the ordering of the
  corresponding dendrogram is by the mean value of the rows/columns,
  i.e., in the case of rows, \code{Rowv <- rowMeans(x, na.rm=na.rm)}.
  %%
  If either is \code{\link{NULL}}, \emph{no reordering} will be done for
  the corresponding side.

  By default (\code{scale = "row"}) the rows are scaled to have mean
  zero and standard deviation one.  There is some empirical evidence
  from genomic plotting that this is useful.

  The default colors are not pretty.  Consider using enhancements such
  as the \pkg{RColorBrewer} package,
  \url{http://cran.r-project.org/package=RColorBrewer}.
}
\note{
  Unless \code{Rowv = NA} (or \code{Colw = NA}), the original rows and
  columns are reordered \emph{in any case} to match the dendrogram,
  e.g., the rows by \code{\link{order.dendrogram}(Rowv)} where
  \code{Rowv} is the (possibly \code{\link{reorder}()}ed) row
  dendrogram.

  \code{heatmap()} uses \code{\link{layout}} and draws the
  \code{\link{image}} in the lower right corner of a 2x2 layout.
  Consequentially, it can \bold{not} be used in a multi column/row
  layout, i.e., when \code{\link{par}(mfrow= *)} or \code{(mfcol= *)}
  has been called.
}
\value{
  Invisibly, a list with components
  \item{rowInd}{\bold{r}ow index permutation vector as returned by
    \code{\link{order.dendrogram}}.}
  \item{colInd}{\bold{c}olumn index permutation vector.}
  \item{Rowv}{the row dendrogram; only if input \code{Rowv} was not NA
    and \code{keep.dendro} is true.}
  \item{Colv}{the column dendrogram; only if input \code{Colv} was not NA
    and \code{keep.dendro} is true.}
}
\author{
Andy Liaw, original; R. Gentleman, M. Maechler, W. Huber, revisions;
Nathan Stephens, minor modifications.
}

\seealso{\code{\link{heatmap}}, \code{\link{image}}, \code{\link{hclust}}}

\examples{
heatmap2(matrix(1:9,3,3))
}
\keyword{hplot}