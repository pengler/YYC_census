###################################
# Clean up the dev environment for package dev testing
#
#
detach("package:YYCcensus", unload=TRUE)
rm (list=ls())
install("YYCcensus")
library ("YYCcensus")
rawCommData <- initCommData()
rawWardData <- initWardData()
