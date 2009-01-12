adk.table<-function(x,digits=NULL)
{
if(!(is.vector(x)|is.factor(x)))
    stop("x must be a vector or a factor")
y<-table(x)
cnames<-c("Freq","Percent","Cum")
rnames<-names(y)
out<-matrix(0,length(y),3,dimnames=list(rnames,cnames))
out[,"Freq"]<-y
out[,"Percent"]<-y/sum(y)
out[,"Cum"]<-cumsum(out[,"Percent"])
if(!is.null(digits)) out<-round(out,digits)
out
}


