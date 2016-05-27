
rankhospital<-function(state,outcome,num = "best")
{
        ## Read Outcome Data
        data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        
        ## Check that the state and outcome are valid 
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
        
        ## Return hospital name in that state with the given rank 
        ## 30-day death rate 
        
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
        
        data[,col] <- suppressWarnings(as.numeric(data[,col]))
        data<-na.omit(data)
        statedata <- subset(data,State==state)
        statedata <- statedata[order(statedata[,col],statedata[,2],na.last = TRUE),2] 
        statedata <- na.omit(statedata)
        
        if(num == "best")
        {
                return(statedata[1])
        }
        else if(num == "worst")
        {
                return(statedata[length(statedata)])
        }
        else if(as.numeric((num)))
        {
                if (num<=length(statedata))
                {
                       
                        return(statedata[num])
                }
                else
                {
                        return(NA)
                }
        }
        else
        {
                return(NA)
        }
        
}