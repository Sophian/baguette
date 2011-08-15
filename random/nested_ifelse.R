# http://stackoverflow.com/questions/4476191/nested-ifelse-r-function-passed-to-sapply-to-create-new-data-frame

d <- data.frame(v = rnorm(10))

nested.ifelse <- function(x) {
  mood <- ifelse (x > 1, "happy",
          ifelse (x < 0, "sad",
          "same as yesterday" ))
  return(mood)
}

nested.ifelse <- function(x)
  ifelse (x > 1, "happy",
  ifelse (x < 0, "sad",
  "same as yesterday" ))

d

d$mood <- nested.ifelse(d$v)
d$mood

d$mood2 <- sapply(d$v, nested.ifelse)
d$mood2
