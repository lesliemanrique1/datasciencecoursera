library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("myapplication",
  key = "d0d4c65875f6a3b8efeb",
  secret = "a1f42a28c39b5c38d05fed6ceec099b3ac6d2403")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
content(req)

library(jsonlite)
json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))
print(names(json2)) 
repos <- json2[,2] 
row <- 0 
for (i in 1:length(repos))
{
	if(repos[i] == "datasharing")
	{
		row <- i
		  
		break 
	} 
} 

print("data sharing created on : ")  
print(json2[row,46] ) 
