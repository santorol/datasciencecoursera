##This function will Rank Hostpiatls for a given state, for a given outcome

# The fucntion will also accept a numeric vector used to find the hospital with that rank

rankhospital<-function(state, outcome, num="best")
{
  #Read the Outcome Data File
  oc<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ##Valid means that it should show an outcome of either heart attack, heart failure, or pneumonia
  mt<-NULL
  if (outcome=="heart attack") mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  if (outcome=="heart failure")  mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  if (outcome=="pneumonia")  mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  if (is.null(mt)) stop("invalid outcome")
  
  #Check the validity of the state
  fst<-state
  st<-oc[oc[mt]!="Not Available",]
  
  #Now limit the results to the state that was given
  st<-st[st["State"]==fst,]
  if (nrow(st)==0) stop("Invalid State")
  
  #Convert the outcome into a number since the field was read as character
  st[,mt]<-as.numeric(st[,mt])
  #Check if Best was selected, then use best function to get result
  if (num=="best"){ #find the best hospital using the Best function
    return(bst<-best(state,outcome))
    stop()}
  if (num=="worst")  ## Find the worst hospital using a similar function 
  { 
  #Now find the worst hospital with the max value
  mx<-max(st[mt])
  ## Return hospital name in that state with highest 30-day death
  wrst<-as.matrix(st[st[mt]==mx,2])
  ##Check for a tie
  if (nrow(wrst)>1) wrst<-as.matrix(wrst[order(wrst)]) #a vector of 1 will return null when a column is not identified
  return(wrst[1,1])
  stop()  
  }
  #Remove the NA values
  st<=st[complete.cases(st[mt]),]
  
  #sort by outcome then by Hostpital name for like values
  st<-st[order(st[,mt],st[,2]),]
  
  #Order the state results by the outcome field so they are in rank order
  #st<-st[order(st[mt]),]
  
  
  #Sort the list using the outcome and then using the hostpital name within the outcome
  #Now find the score that matches the rank that was passed to the function
  #rnk<-st[num,mt]
  
  #Find all of the hospitals that match this rank so that we can see if there is a tie
  
  ##srnk<-st[st[mt]==rnk,]
  ##if (nrow(srnk)>1) srnk<-as.matrix(srnk[order(srnk),]) #a vector of 1 will return null when a column is not identified
  
  return(st[num,2])
}