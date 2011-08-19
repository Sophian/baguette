##### Lecture 19: Tables
# http://had.co.nz/stat405/lectures/19-tables.pdf

# Read data
setwd("/Users/sbensaou/git/baguette/stat_405/")
tips <- read.csv("tipping.csv", head = TRUE); head(tips)

# Create data set
tips <- data.frame(customer.id = c(1, 2, 3),
                   total.bill = c(20.53, 21.70, 19.65),
                   tip = c(4.00, 4.30, 3.00),
                   female = c(0, 0, 1),
                   male = c(1, 1, 0))

# Melt the data
library(reshape)
library(reshape2)
tips1 <- melt(tips,
              id = c("customer.id", "total.bill", "tip"),
              variable.name = "gender"); head(tips1)

names(tips1)[4] <- "gender"; head(tips1)
tips1 <- subset(tips1, value == 1)[ , 1:4]; head(tips1)
