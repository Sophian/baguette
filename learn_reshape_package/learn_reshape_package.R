# Learn reshape package in R to make Pivot Tables
# http://news.mrdwab.com/2010/08/08/using-the-reshape-packagein-r/

##### Part 1: Contingency Tables Using Built-in Functions

# Read data
setwd("/Users/sophian/git/baguette/learn_reshape_package/")
handedness <- read.table("WikipediaHandedness.csv", header=T, sep=",")

# Use table command
head(handedness)
table(handedness)

# Add a couple of columns to the data
set.seed(123)
fav.col = sample(c("red", "green", "blue"), 12, replace = T)

set.seed(123)
fav.shape = sample(c("square", "triangle", "circle"), 12, replace = T)

handedness.plus = cbind(handedness, fav.col, fav.shape)
head(handedness.plus)

# Make new table to see new data
names(handedness.plus)
table(handedness.plus$fav.col, handedness.plus$Gender,
      handedness.plus$Handedness)

# Use xtabs
xtabs(~ fav.col + Gender + Handedness, handedness.plus)

# Use ftable (flat table) which is even more flexible
names(handedness.plus)
ftable(handedness.plus, row.vars = 3, col.vars = c(1, 2))

ftable(handedness.plus, row.vars = 1, col.vars = c(2, 4))

ftable(handedness.plus, row.vars = 1:3, col.vars = 4)

##### Part 2: Advanced Results Using the Reshape Package

# Read data
library(reshape)
setwd("/Users/sophian/git/baguette/learn_reshape_package/")
book.sales <- read.table("booksales.csv", header=T, sep=",")
head(book.sales)

# I need to MELT the data:
# It asks for id variables (id.vars) and measured variables (measured)
m.book.sales = melt(book.sales, id.vars = 1:5)

# The counterpart to MELT is CAST
# Mention the dataset and the reshape function I want to use.
# Use the tilde ~ symbol to define relationships i.e. "is described by"
# FYI the "variable" is the collection of measured columns I set up earlier.
# If I just specify "variable", cast will summarize data for all columns
# Look further below for an example of subsetting to get only the data I want
cast(m.book.sales, Region ~ variable)

# Make sure to include an interesting function to aggregate the data
cast(m.book.sales, Region ~ variable, sum)

# Sort first by region, then by representative
cast(m.book.sales, Region + Representative ~ variable, sum)

# What if we have the same publisher in multiple regions?
cast(m.book.sales, Region + Publisher ~ variable, sum)

# Add another tilde ~ after "variable" to get some separated tables
cast(m.book.sales, Region ~ variable ~ Publisher, sum)

# To get totals, add "margins"
cast(m.book.sales, Region ~ variable, sum, margins=c("grand_col", "grand_row"))

# Include multiple functions
cast(m.book.sales, Region ~ variable, c(sum, mean))

# Subset our Data and retrieve the info I really need
cast(m.book.sales, Region + Representative ~ variable,
     c(length, sum, mean),
     subset = variable %in% "Sales")

cast(m.book.sales, Region + Representative ~ variable,
     c(sum, mean),
     subset = variable %in% c("Sales", "Quantity"))
