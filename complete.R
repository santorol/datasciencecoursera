complete<-function(directory, id=1:332){
  cnt=0
  for (x in id){
    dt<-read.csv(paste(directory, "\\",formatC(x,width = 3,flag="0"),".csv",sep=""))
    rws<-dt[complete.cases(dt),]
    if (cnt==0) rc<-nrow(rws)
    else rc<-rbind(rc,nrow(rws))
    cnt=cnt+1
  }
  rc
}