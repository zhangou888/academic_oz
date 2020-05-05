#########################################################
##                                                     ##
##      Configure JAVA environment for rJava package   ##
######################################################### 
options(java.home="C:/Program Files (x86)/Java/jdk1.8.0_181/jre")
Sys.setenv(JAVA_HOME='C:/Program Files (x86)/Java/jdk1.8.0_181/jre')
Sys.getenv("JAVA_HOME")

packages <- c("devtools")

packages <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x)
    library(x, character.only = TRUE)
  }
})

library(devtools)
devtools::install_github("cran/rJava")
library(rJava)

library(xlsx)
