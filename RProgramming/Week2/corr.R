#Programming Assignment Week 2
#Part 3

corr <- function(directory,threshold = 0 )
{
        ## 'directory' is a character vector of length 1 indicating 
        ## the location of the csv file 
        
        ## 'threshold' is a chatacter vector of length 1 indicating the
        ## number of completely observed observations (on all 
        ## variables) required to compute the correlation between 
        ## nitrate and sulfate; the default is 0 
        
        ## Return a numeric vector of correlations 
        ## NOTE: Do not round the result! 
        list_files = list.files(directory, pattern = "*.csv") 
        df = complete(directory) ##call to function complete 
        ids = df[df["nobs"] > threshold, ]$id #get ids where nobs > threshold
        correlation = numeric() 
        for (i in ids)
        {
                file <- paste(directory,"/",list_files[i],sep = "") 
                read <- read.csv(file)
                df2 = read[complete.cases(read), ]
                correlation = c(correlation,cor(df2$sulfate,df2$nitrate)) #correlates 2 vectors
        }
        
        return(correlation)
        
}