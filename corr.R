corr<-function(directory,threshold=0)
{
  cnt=0
  for (x in 1:332){
      if ((complete(directory,x))>threshold){
       dt<-read.csv(paste(directory, "\\",formatC(x,width = 3,flag="0"),".csv",sep=""))
       rws<-dt[complete.cases(dt),]
        if (cnt==0) cr<-cor(rws$sulfate,rws$nitrate)
        else 
          cr<-rbind(cr,cor(rws$sulfate,rws$nitrate))
          cnt=cnt+1
       }
  }
  cr
}