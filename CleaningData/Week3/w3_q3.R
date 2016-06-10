#Week 3 Quiz

#Question 1 

q1<- function(){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
        f <- file.path(getwd(), "hid.csv") 
        if(!file.exists(f)){
                download.file(url,f) 
        }
        df <- read.csv(f, header = TRUE, sep = ",") 
        
       
        
        #households greater than 10 acres (ACR == 3) 
        # > 10000 worth agricultural products (AGS == 6)
        
        agricultureLogical <- df$ACR == 3 & df$AGS == 6
        which(agricultureLogical)
        
        
}


q2<- function(){
        library(jpeg)
        url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
        f <- file.path(getwd(), "jeff.jpg") 
        if(!file.exists(f)){
                download.file(url,f) 
        } 
        img <- readJPEG(f,native=TRUE)
        quantile(img,c(0.3,0.8))
}


q3<- function(){
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
        f <- file.path(getwd(), "GDP.csv") 
        url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
        f2 <- file.path(getwd(), "EDU.csv") 
        if(!file.exists(f)){
                download.file(url,f) 
        } 
        if(!file.exists(f2)){
                download.file(url2,f2) 
        } 
        
        GDP <- read.csv(f, skip = 4, nrows = 190) 
        EDU <- read.csv(f2, header = TRUE, sep = ",") 
        GDP<-GDP[,c(1,2,4,5)]
        colnames(GDP)<-c("CountryCode", "Rank", "Country.Name", "GDP.Value")
        GDP$GDP.Value <- as.numeric(gsub(",", "", GDP$GDP.Value))
        mergedData <- merge(GDP,EDU,by.x = "CountryCode",by.y = "CountryCode")
        
        #answer q3 
        #print(arrange(mergedData, desc(Rank))[13, 3]) 
        
        #answer q4 
        #mean GDP Rank for "High income: OECD" and "High income: nonOECD" group 
        #tapply(mergedData$Rank, mergedData$`Income.Group`, mean) 
        
        #answer q5 
        #Cut the GDP ranking into 5 separate quantile groups. 
        #Make a table versus Income.Group. 
        #How many countries are Lower middle income but among the 38 nations 
        #with highest GDP?
        #library("Hmisc")
        #mergedData$RankGroups <- cut2(mergedData$Rank, g=5)
        #table(mergedData$Income.Group,mergedData$RankGroups)
}





