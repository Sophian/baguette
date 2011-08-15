# Follow tutorial on Data Reorganization
# http://www.macalester.edu/~kaplan/startingwithr/Data-Reorganization.pdf

# Read data
setwd("/Users/sbensaou/git/baguette/data_reorganization/")
osteo <- read.table("Osteoporosis.csv", header = TRUE, sep = ",")
head(osteo)

library(reshape)

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

# Reshaping the Data
## Want there to be one case for each measurement occasion.
## Collapse the four beck_a variables into a single variable and
## add another variable that tells WHEN the measurement was made.
tiny <- head(measurements, 2)
tiny

# The Reshape Operator
## R has a large collection of specialized operators.
## Often these are very sophisticated and the documentation is a challenge.
reshape(tiny,
        idvar = "id",
        direction = "long",
        varying = list(2:5))

reshape(tiny,
        idvar = "id",
        direction = "long",
        varying = list(2:5),
        times = c("winter", "spring", "summer", "fall"))

reshape(tiny,
        idvar = "id",
        direction = "long",
        varying = list(2:5),
        times = c("winter", "spring", "summer", "fall"),
        v.names = c("anxiety"))

# Expand the test case a bit
measurements <- subset(osteo,
                     select = c(id, beck_a1, beck_a2, beck_a4, beck_a4,
                                beck_d1, beck_d2, beck_d3, beck_d4,
                                bmi1, bmi2, bmi3, bmi4))

head(measurements)

tiny <- head(measurements, 2)
head(tiny)

reshape(tiny,
        idvar = "id",
        direction = "long",
        varying = list(2:5, 6:9, 10:13),
        times = c("winter", "spring", "summer", "fall"),
        v.names = c("anxiety", "depression", "bmi"))

occasions <- reshape(measurements,
                    idvar = "id",
                    direction = "long",
                    varying = list(2:5, 6:9, 10:13),
                    times = c("winter", "spring", "summer", "fall"),
                    v.names = c("beck.anxiety", "beck.depression", "bmi"))

aggregate(occasions$beck.anxiety,
          list(season = occasions$time),
          mean,
          na.rm = TRUE)

mean(osteo$beck_a1, na.rm = TRUE)

mean(osteo$beck_a4, na.rm = TRUE)

# Finally ... The whole thing

measurements <- subset(osteo,
                      select = c(id, beck_a1, beck_a2, beck_a3, beck_a4,
                                 beck_d1, beck_d2, beck_d3, beck_d4,
                                 bmi1, bmi2, bmi3, bmi4,
                                 host1, host2, host3, host4,
                                 anger1, anger2, anger3, anger4,
                                 irrit1, irrit2, irrit3, irrit4,
                                 anxiety1, anxiety2, anxiety3, anxiety4,
                                 dirwdc1, dirwdc2, dirwdc3, dirwdc4,
                                 dirwec1, dirwec2, dirwec3, dirwec4))

head(measurements)

# Notice that there are 9 sets of variables. Now convert to "long" form.
occasions <- reshape(measurements,
                     idvar = "id",
                     direction = "long",
                     varying = list(2:5, 6:9, 10:13, 14:17, 18:21,
                                    22:25, 26:29, 30:33),
                     times = c("winter", "spring", "summer", "fall"),
                     v.names = c("beck.anxiety", "beck.depression",
                                 "bmi", "hostility", "anger", "anxiety",
                                 "sun.weekday", "sun.weekend"))

head(occasions)

# Check again
aggregate(occasions$sun.weekend,
          list(season = occasions$time),
          mean,
          na.rm = TRUE)

mean(osteo$dirwec1, na.rm = TRUE)
mean(osteo$dirwec2, na.rm = TRUE)
mean(osteo$dirwec3, na.rm = TRUE)
mean(osteo$dirwec4, na.rm = TRUE)

# Something's wrong
# Now go find out what. I went through looking column by column
head(occasions$beck.depression)
head(osteo$beck_d1)
head(occasions$bmi)
head(osteo$bmi1)
head(occasions$irritability)
head(osteo$irrit1)

# I discover that I left the "irritability" out of the names of variables.
# There were actually only 8 variables that I converted.

occasions <- reshape(measurements,
                     idvar = "id",
                     direction = "long",
                     varying = list(2:5, 6:9, 10:13, 14:17, 18:21,
                                    22:25, 26:29, 30:33, 34:37),
                     times = c("winter", "spring", "summer", "fall"),
                     v.names = c("beck.anxiety", "beck.depression", "bmi",
                                 "hostility", "anger", "anxiety",
                                 "irritability", "sun.weekday", "sun.weekend"))

aggregate(occasions$sun.weekend,
          list(season = occasions$time),
          mean,
          na.rm = TRUE)

mean(osteo$dirwec1, na.rm = TRUE)
mean(osteo$dirwec2, na.rm = TRUE)
mean(osteo$dirwec3, na.rm = TRUE)
mean(osteo$dirwec4, na.rm = TRUE)

# Documenting that you have done the right thing
check.var <- function(orig, new) {
  origmeans = aggregate(occasions[[new]], list(season = occasions$time),
                        mean, na.rm = TRUE)
  winter = mean(osteo[[paste(orig, "1", sep = "")]],
                na.rm = TRUE)
  spring = mean(osteo[[paste(orig, "2", sep = "")]],
                na.rm = TRUE)
  summer = mean(osteo[[paste(orig, "3", sep = "")]],
                na.rm = TRUE)
  fall = mean(osteo[[paste(orig, "4", sep = "")]],
              na.rm = TRUE)
  return(c(subset(origmeans, season == "winter")$x == winter,
           subset(origmeans, season == "spring")$x == spring,
           subset(origmeans, season == "summer")$x == summer,
           subset(origmeans, season == "fall")$x == fall))
}

check.var("beck_a", "beck.anxiety")

check.var("beck_d", "beck.depression")

# Finishing Up!
## Does anxiety vary with the seasons?
xtable(anova(lm(beck.anxiety ~ time + as.factor(id), data = occasions)))

## Does BMI vary with the seasons?
xtable(anova(lm(irritability ~ time + as.factor(id), data = occasions)))
