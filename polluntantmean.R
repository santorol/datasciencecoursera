pollutantmean<-function(directory, pollutant, id=1:332){
  cnt=0
  for (x in id){
    dt<-read.csv(paste(directory, "\\",formatC(x,width = 3,flag="0"),".csv",sep=""))
    dt<-dt[complete.cases(dt[pollutant]),]
   if (cnt==0)
     master<-dt[pollutant]
    else master<-rbind(master[pollutant],dt[pollutant])
    cnt=cnt+1
  }
  mean(as.numeric(master[[pollutant]]))
}