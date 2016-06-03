url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines<- readLines(url, n=10) 
#fixed width
col_seq <- c(-5, 4, 4) 
w <- c(-1, 9, col_seq, col_seq, col_seq, col_seq)
df <- read.fwf(url, w, header=FALSE, skip=4)
print(head(df[,4]))
sum <- sum(df[,4])
print(sum)