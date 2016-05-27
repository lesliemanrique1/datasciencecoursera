best<-function(state,outcome)
{
        ## Read Outcome Data
        data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
        ## Check that State and Outcome are valid
        state_valid <- FALSE 
        data_states <- unique(data[,7]) 

        state = toupper(state) 
        for (i in data_states)
        {
                if(state == i)
                {
                        state_valid <- TRUE 
                        break 
                }
        }
        if (!state_valid)
        {
                stop("invalid state")
        }
        
        valid_outcomes <- c("heart attack","heart failure","pneumonia")
 
        outcome = tolower(outcome)
        outcome_valid <- outcome %in% valid_outcomes ##checks to see if outcome is valid
        if(!outcome_valid)
        {
                stop("invalid outcome")
        }
        col <- if(outcome == "heart attack")
        {
                11
        }
        else if(outcome == "heart failure")
        {
                17
        }
        else
        {
                23
        }
        
        
        
        ## Return hospital name in the state with the lowest 30-day death rate 
        
        data[,col] <- suppressWarnings(as.numeric(data[,col]))
        data<-na.omit(data)
        statedata <- subset(data,State==state)
        statedata <- statedata[order(statedata[,col],na.last = TRUE),2]
        statedata<-na.omit(statedata)
        
        return (statedata[1])
        
}