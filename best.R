#This funtion will find the best hospitals in the state
best <- function(state, outcome) {
  ## Read outcome data
  oc<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  ##First focus on the correct variable
  mt<-NULL
  if (outcome=="heart attack") mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  if (outcome=="heart failure")  mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  if (outcome=="pneumonia")  mt<-"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  if (is.null(mt)) stop("invalid outcome")
  ##Valid means that it should show an outcome of either heart attack, heart failure, or pneumonia
  fst<-state
  st<-oc[oc[mt]!="Not Available",]
  #Now limite the results to the state that was given
  st<-st[st["State"]==fst,]
  if (nrow(st)==0) stop("Invalid State")
  #now make sure the values are number
  st[,mt]<-as.numeric(st[,mt])
  #Now find the hospitals with the minimum value
  mn<-min(st[mt])
  ## Return hospital name in that state with lowest 30-day death
  bst<-as.matrix(st[st[mt]==mn,2])
  ##Check for a tie
  if (nrow(bst)>1) bst<-as.matrix(bst[order(bst)]) #a vector of 1 will return null when a column is not identified
      
  (bst[1,1])
  ## 
}