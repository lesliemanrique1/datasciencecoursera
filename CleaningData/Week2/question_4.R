con <- url("http://biostat.jhsph.edu/~jleek/contact.html") 
html <- readLines(con)
close(con)
chars <- c(nchar(html[10]),nchar(html[20]),nchar(html[30]),nchar(html[100])) 
print(chars)


