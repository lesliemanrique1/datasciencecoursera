#Programming Assignment Week 2
#Problem 2 

complete <- function(directory, id = 1:332)
{
        ## 'directory' is a character vector of length 1 indicating 
        ## the location of the csv file 
        
        ## 'id' is the integer vector indicating the monitor ID numbers 
        ##  to be used
        
        ## Return a data frame of the form: 
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases 
        
        nobs = numeric() 
        list_files = list.files(directory, pattern = "*.csv") 
        for (i in id)
        {
                file <- paste(directory,"/",list_files[i],sep = "") 
                data <- read.csv(file)
                nobs = c(nobs,sum(complete.cases(data))) #concactenate 
        }
      
        return (data.frame(id,nobs))
}
