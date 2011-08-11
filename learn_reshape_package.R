# Learn reshape package in R to make Pivot Tables
# http://news.mrdwab.com/2010/08/08/using-the-reshape-packagein-r/

# Part 1: Contingency Tables Using Built-in Functions
setwd("/Users/sophian/git/baguette/learn_reshape_package/")
handedness <- read.table("WikipediaHandedness.csv", header=T, sep=",")

head(handedness)
table(handedness)

set.seed(123)
fav.col = sample(c("red", "green", "blue"), 12, replace = T)