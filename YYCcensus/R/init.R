########################
# init.r
#
# Set up environment, retreive and merge data
#

#' @import RCurl
#' @import data.table

library ("RCurl")
library ("data.table")

data(comm_sources,ward_sources)
cacheDir=".cache"

# A mergeCensusCSV function 
#
# This function will load data from multiple csv files into a single data frame.
# param path path to directory containing the csv files
# param csvpattern mathing pattern for the csv files
# export
# examples mergeCensusCSV('.config','comm\\.csv')
# mergeCensusCSV(path,csvpattern)
mergeCensusCSV <- function(path,csvpattern) { 
  files <- dir(path, pattern = csvpattern, full.names = TRUE)
  tables <- lapply(files, read.csv)
  rbindlist(tables, fill=TRUE)
}

#' initCommData Retreive and initalize census data
#
#' This function will load data from multiple csv files into a single data frame.
#' @param path path to directory containing the csv files
#' @param csvpattern mathing pattern for the csv files
#' @export
#' @examples myDF <- initCommData()
#' initCommData()
initCommData <- function () {
   
   # create the directory for cached data
   dir.create(file.path(cacheDir), showWarnings = FALSE)


   # todo: get rid of for loop and make this more R like
   for (i in 1:nrow(YYCCensusCommSRC)) {
      targetFile=file.path(cacheDir,YYCCensusCommSRC[i,]$File)
      if (! file.exists(targetFile)) {
         download.file(YYCCensusCommSRC[i,]$HTTPSource,
                       destfile=file.path(targetFile),
                       method="libcurl",
                       quiet = FALSE )
     }
   }
rawCommData<-mergeCensusCSV(cacheDir,'comm\\.csv')
return (rawCommData)
}

#' initWardData Retreive and initalize census data
#
#' This function will load data from multiple csv files into a single data frame.
#' @param path path to directory containing the csv files
#' @param csvpattern mathing pattern for the csv files
#' @export
#' @examples myDF <- initCommData()
#' initWardData()
initWardData <- function () {

      # create the directory for cached data
   dir.create(file.path(cacheDir), showWarnings = FALSE)
   
   
   # todo: get rid of for loop and make this more R like
   for (i in 1:nrow(YYCCensusWardSRC)) {
      targetFile=file.path(cacheDir,YYCCensusWardSRC[i,]$File)
      if (! file.exists(targetFile)) {
         download.file(YYCCensusWardSRC[i,]$HTTPSource,
                       destfile=file.path(targetFile),
                       method="libcurl",
                       quiet = FALSE )
      }
   }
   rawWardData<-mergeCensusCSV(cacheDir,'ward\\.csv')
   return (rawWardData)
}
#rm (list=c("cacheRow","commURLS","wardURLS","i","targetFile"))
