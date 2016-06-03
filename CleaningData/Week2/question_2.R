#Week 2 - Quiz - Question 2 and Question 3 

library(sqldf)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "survey.csv")
#download.file(url, f)


if(!file.exists(f)){
        res <- tryCatch(download.file(url,f),
                        error=function(e) 1)
        if(dat!=1) load(f) 
}
acs <- read.csv(f, header = TRUE, sep = ",") 

query <- sqldf("select pwgtp1 from acs where AGEP < 50") 
print(head(query))

un <- unique(acs$AGEP) 
print(un)


unique <- sqldf("select distinct AGEP from acs ")


