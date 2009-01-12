colr<-function(col.pal=1,a=1)
{
    col.rgb<-col2rgb(col.pal)/255
    rgb(t(col.rgb),alpha=a)
}
