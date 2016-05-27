
rankall<-function(outcome,num = "best")
{
        ## Read Outcome Data
        data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
        
        ## Check that outcome is valid 
       
        
        outcome = tolower(outcome)
        if(!(outcome %in% c("heart attack","heart failure","pneumonia")))
        {
                stop("invalid outcome")
        }
        
        
        
        ## For each state, find the hospital of the given rank 

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
        data <- data[!is.na(data[,col]),]
        
        sorted <- data[order(data[,col], data[,2], na.last=TRUE),]
        sorted <- sorted[!is.na(sorted[,col]),]
  
        states <- sort(unique(sorted[,7])) 
        if(num == "best"){
                num <- 1 
        }
              
        else if(num == "worst"){
                num <- length(sorted)
                
        }
              
        else
        {
                num<-as.numeric(num)
        }


        state_rank <- function(state)
        {
                statedata <- subset(sorted,State==state)
                statedata <- statedata[num,c(2,7,col)]
                statedata$State<-state 
                return(statedata)
        }
        
        statedata <- lapply(states,state_rank)
        #df <- as.data.frame(matrix(statedata,length(states),2,byrow=TRUE))
        df <- as.data.frame(do.call(rbind, statedata), row.names=states)
        colnames(df)<-c("hospital","state")
        
        return(df)
                
        
        
   
      
        
}