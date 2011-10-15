#####################
##### TRIATHLON #####
#####################

### Read Data
setwd("/Users/sophian/Documents/RData/")

times <- read.table("stratford.csv", header = TRUE, sep = "\t",
                    stringsAsFactors = FALSE, na.strings = "")

head(times)

# Transform the Times From Character Strings to Numeric (in Minutes)
install.packages("ggplot2")

library("ggplot2")
library("stringr")
stringToMinutes <- colwise (
  function (s)
    unlist(
      lapply(
        str_split(s, ":"), function(s)
          sum(as.numeric(s) * c(60, 1, 1/60))
      )
    ),
  .(Swim, Cycle, Run, Total)
)

# Apply the Above Transform to the times Data Frame
times <- ddply (
  times, .(Position, StartingPosition, Category), stringToMinutes)

head(times)

