##### How can I subset a data set?
# http://www.ats.ucla.edu/stat/r/faq/subset_R.htm

x <- matrix(rnorm(30, 1), ncol = 5)
y <- c(1, seq(5))

# Combine x and y into one matrix
x <- cbind(x, y)

# Convert x into a data frame called x.df
x.df <- data.frame(x)
x.df

names(x.df)

# Subset rows using the subset function
x.sub <- subset(x.df, y > 2)
x.sub

# Subset rows using multiple conditional statements
x.sub1 <- subset(x.df, y > 2 & V1 > 0.6)
x.sub1

# Subset both rows and columns
x.sub2 <- subset(x.df, y > 2 & V2 > 0.4, select = c(V1, V4))
x.sub2

x.sub3 <- subset(x.df, y > 3, select = V2:V5)
x.sub3

# Subset rows using indices
x.sub4 <- x.df[x.df$y == 1, ]
x.sub4

# Subset rows selecting on more than one value
# %in% is equivalent to MySQL's IN
x.sub5 <- x.df[x.df$y %in% c(1, 4), ]
x.sub5

# Subset columns using indices
x.sub6 <- x.df[, 1:2]
x.sub6

x.sub7 <- x.df[, c(1, 3, 5)]
x.sub7

# Subset both rows and columns using indices
x.sub8 <- x.df[c(1, 3), 3:6]
x.sub8
