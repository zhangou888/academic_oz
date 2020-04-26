##########################################################################################
#                                                                                       ## 
##          Project: Example of JSON Parse R-package Comparison                         ##
##--------------------------------------------------------------------------------------##
##          Programmer: Ou Zhang                                                        ##
##          Request Date: 12/30/2015                                                    ##
##          Initial Code: 12/30/2015                                                    ##
##          Goals: To Compare 3 main JSON Parse R-package Performance                   ##
##                 Used for Conference Presentation                                     ##
##          Input: Install 3 packages                                                   ##
##          Output: See results in the R Console                                        ##
##          Note:  Possible New R-package may be available                              ##
##--------------------------------------------------------------------------------------##
##          Modification History:                                                       ##
##          When: 07/24/2016                                                            ##
##          Who:  Ou Zhang                                                              ##
##          Change: For conference use (07/29/2016--07/31/2016)                         ##
##--------------------------------------------------------------------------------------##
## Step 1: Set work directory
# remove all the existing list #
rm(list=ls())
data_dir <- "C:/Users/UZHANOU/Documents/Pearson CPT/data/json"
setwd(data_dir)

# Install Packages #
packages <- c("rjson","jsonlite","RJSONIO")
packages <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x)
    library(x, character.only = TRUE)
  }
})

# comparison 1: Data frame #
all.equal(mtcars, rjson::fromJSON(rjson::toJSON(mtcars)))       # rjson
all.equal(mtcars, RJSONIO::fromJSON(RJSONIO::toJSON(mtcars)))   # RJSONIO
all.equal(mtcars, jsonlite::fromJSON(jsonlite::toJSON(mtcars))) # jsonlite

# Comparison 2: Matrix #
(x <- matrix(1:6, 2))

rjson::fromJSON(rjson::toJSON(x))
RJSONIO::fromJSON(RJSONIO::toJSON(x))
jsonlite::fromJSON(jsonlite::toJSON(x))

# Comparison 3: List #
x <- list(foo = 123, bar= 456)

rjson::fromJSON(rjson::toJSON(x))
RJSONIO::fromJSON(RJSONIO::toJSON(x))
jsonlite::fromJSON(jsonlite::toJSON(x))

# Comparison 4: Missing value #
rjson::fromJSON(rjson::toJSON(c(1,2,NA,4)))
RJSONIO::fromJSON(RJSONIO::toJSON(c(1,2,NA,4)))
jsonlite::fromJSON(jsonlite::toJSON(c(1,2,NA,4)))

# Comparison 5: Escaping #
x <- list("\b\f\n\r\t" = "\b\f\n\r\t")

identical(x, rjson::fromJSON(rjson::toJSON(x)))
identical(x, RJSONIO::fromJSON(RJSONIO::toJSON(x)))
identical(x, jsonlite::fromJSON(jsonlite::toJSON(x)))

# Comparison 6: Parser error handling #
rjson::fromJSON('[1,2,boo",4]')
RJSONIO::fromJSON('[1,2,boo",4]')
jsonlite::fromJSON('[1,2,boo",4]')


# Comparison 7: Unicode #
json = '["\\u5bff\u53f8","Z\\u00fcrich", "\\u586B"]'

rjson::fromJSON(json)
RJSONIO::fromJSON(json)
jsonlite::fromJSON(json)

# Comparison 8: Prettify, validate #
# Only RJSONIO and jsonlite have functionality to validate or prettify JSON: #
x <- list(foo = c("hi", "hello"), bar=1:3)

cat(RJSONIO::toJSON(x, pretty = TRUE))
cat(jsonlite::toJSON(x, pretty = TRUE))

RJSONIO::isValidJSON(RJSONIO::toJSON(x), asText = TRUE)
jsonlite::validate(jsonlite::toJSON(x))

# Comparison 9: Digits #
# RJSONIO uses significant digits, 
# whereas jsonlite uses decimal digits. 
# rjson does not support this.
rjson::toJSON(pi)
RJSONIO::toJSON(pi, digits=4)
jsonlite::toJSON(pi, digits=4)

# Comparison 10: Controlling simplification #
# Only RJSONIO and jsonlite give control over vector simplification. 
# rjson always simplifies if possible.
json <- '[1,2,3,4]'
RJSONIO::fromJSON(json)

RJSONIO::fromJSON(json, simplify = FALSE)

jsonlite::fromJSON(json)
jsonlite::fromJSON(json, simplifyVector = FALSE)

# Comparison 11: generating JSON ##
# Comparing performance is a bit difficult because different packages 
# do different things. The rjson package has no options to control conversion, 
# so the only way to benchmark common functionality is by trying to mimic rjson:
install.packages("microbenchmark")
library(microbenchmark)
data(diamonds, package="ggplot2")
microbenchmark(
  rjson::toJSON(diamonds),
  RJSONIO::toJSON(diamonds),
  jsonlite::toJSON(diamonds, dataframe = "column"),
  times = 10
)

# What if we throw some missing values in the mix:
diamonds2 <- diamonds
diamonds2[1,] <- NA;
microbenchmark(
  rjson::toJSON(diamonds2),
  RJSONIO::toJSON(diamonds2),
  jsonlite::toJSON(diamonds2, dataframe = "column"),
  times = 10
)

# Comparison 12:  Parsing JSON
json <- rjson::toJSON(diamonds)
microbenchmark(
  rjson::fromJSON(json),
  RJSONIO::fromJSON(json, simplifyWithNames=FALSE),
  jsonlite::fromJSON(json, simplifyDataFrame = FALSE, simplifyMatrix = FALSE),
  times = 10
)


##--- EOF ---##

