best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.CSV", header = TRUE)
  
  ## Check that state and outcome are valid
  if (state %in% data[7] == FALSE) {
    stop(print("invalid state"))
  }
  
  
    names <- c("heart attack", "heart failure", "pneumonia")
    if (outcome %in% names == FALSE) {
     stop(print("invalid outcome"))  
    }
  ## Return hospital name in that state with lowest 30-day death
    keepcols <- c("Hospital.Name", "State", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    statedf <- subset(data, State == state, select = keepcols)
    names(statedf)  <- c("Hospital_name","State", "Heart_attack", "Heart_failure", "Pneumonia")
    
    #### Still need to define which inputs(heart attack/heart failure/pneumonia) are tied to the variable "outcome"
    
    positions <- order(statedf$outcome, statedf$Hospital_name, decreasing = FALSE, na.last = TRUE)
    largest_first_df <- statedf[positions, ]
  ## rate
    largest_first_df[1,1]

  
    
}
