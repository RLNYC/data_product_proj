
#devtools are needed for installation of slidify
install.packages("devtools")
library(devtools)

install_github("slidify","ramnathv")
install_github("slidifyLibrary","ramnathv")

setwd("~/Desktop/Johns Hopkins Data Sci/data product/project")
library(slidify)

#create project name
author("Project Presentation")

#Publish
publish_github(user,repo_name)

#Enter inline math code $x^2$



