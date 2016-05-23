#Quiz Problems 11 : 20 

#Load CSV File into database 

dataset <- read.csv("hw1_data.csv")

#QUESTION 1
print("QUESTION 1 : What are the column names of the data frame?")
question1 <- names(dataset)
print(question1)
#colnames(dataset) also works 
#row.names(dataset) or rownames(dataset)to find row names 

#QUESTION 2 
print("QUESTION 2 : Extract the first 2 rows of the data frame and print them to the console. What does the output look like?") 

#question2 <- dataset[1:2,] 
#or 
question2 <- head(dataset,2)
print(question2)


#QUESTION 3
print("QUESTION 3 : How many rows?")

question3 <- nrow(dataset)
print(question3)


#QUESTION 4 
print("QUESTION 4 : Extract the last 2 rows of the data frame and print them to the console. What does the output look like?")
n <- nrow(dataset)
question4 <- dataset[(n-2 + 1):n,]
print(question4)


#QUESTION 5 
print("QUESTION 5 : How many missing values are in the 'Ozone' Column of the data frame?")

miss <- is.na(dataset[, "Ozone"]) #a vector of true or false
#goes through each row and checks if column "Ozone" is.na 
question5 <- sum(miss) 
print(question5)

#QUESTION 6
print("QUESTION 6 : What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.")
#first way: 
#question6<- mean(dataset[, "Ozone"], na.rm = TRUE)
#second way:
use <- !is.na(dataset[,"Ozone"]) #find non missing values
question6 <- mean(dataset[use,"Ozone"])
print(question6)

#QUESTION 7
print("QUESTION 7 : Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?")

question7 <- subset(dataset, Ozone > 31 & Temp > 90)

mean_question7 <- mean(question7[,"Solar.R"])
print(mean_question7)

#QUESTION8
print("QUESTION 8 : What is the mean of 'Temp' when 'Month' is equal to 6")
question8 <- subset(dataset, Month == 6) 
mean_question8 <- mean(question8[,"Temp"])
print(mean_question8)


#QUESTION9
print("QUESTION 9 : What was the maximum ozone value in the month of May (i.e. Month = 5)?")
question9 <- max(dataset$Ozone[dataset$Month==5 & !is.na(dataset$Ozone)])
print(question9)

print("other")
question9 <- subset(dataset,!is.na(Ozone) & Month == 5)
print(question9)
maxi <- max(question9["Ozone"])
print(maxi)