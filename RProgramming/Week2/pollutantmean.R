#Programming Assignment 

#Part 1

pollutantmean <- function(directory,pollutant,id = 1:332)
{
	## 'directory' is a character vector of length 1 indicating 
	## the location of the csv file 
	
	## 'pollutant' is a character vector of length 1 indicating 
	## the name of the pollutant for which we will calculate the 
	## mean; either sulfate or nitrate 
	
	## 'id' is the integer vector indicating the monitor ID numbers 	##	to be used
	
	##	Return the mean of the pollutant across all monitors list
	##	in the 'id' vector (ignoring NA values) 
	##	NOTE: Do not round the result! 
	
	list_files = list.files(directory, pattern = "*.csv")
	data <- data.frame() 
	for(i in id)
	{
		file <- paste(directory,"/",list_files[i],sep = "") 
		data <- rbind(data,read.csv(file))
	}
	
	mean(data[,pollutant],na.rm = TRUE)
	
	
}