# Follow tutorial on Data Reorganization
# http://www.macalester.edu/~kaplan/startingwithr/Data-Reorganization.pdf

# Read data
setwd("/Users/sophian/git/baguette/data_reorganization/")
osteo <- read.table("Osteoporosis.csv", header = TRUE, sep = ",")
head(osteo)

# Validating the Data
## Is there a unique ID for each person?
nrow(osteo)
length(unique(osteo$id))

## Is BMI the range expected?
summary(osteo$bmi)

# Pull out Variables for the First Table
## Call new data.frame person since it has info
## with the individual person as the case
person = subset(osteo, select = c(id, mstatus, schoolyr, age, sayhlth))
head(person)

# Recoding Marital Status
marital <- factor(person$mstatus,
                  levels = 1:6,
                  labels = c("single", "married", "cohabit",
                             "sep.", "divorced", "widowed"))

# Recoding Marital Status: Verifying the Work
table(marital, person$mstatus)

# Exercise: Recoding the Health
health <- factor(person$sayhlth,
                 levels = 1:5,
                 labels = c("excel", "vgood", "good", "fair", "poor"),
                 ordered = TRUE)

table(health, person$sayhlth)

# Finish the recoding
## Put the new variables in place of the old ones
person$sayhlth <- health
person$mstatus <- marital

# Pull out the second table

measurements <- subset(osteo,
                       select = c(id, beck_a1, beck_a2, beck_a3, beck_a4))
head(measurements)


