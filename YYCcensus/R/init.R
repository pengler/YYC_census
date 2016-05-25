########################
# init.r
#
# Set up environment, retreive and merge data
#

require ("RCurl")
require ("data.table")

#if (!exists("config")) {source ("../config.R") }

years <- 1999:2015
files <- c("1999comm.csv","2000comm.csv","2001comm.csv","2002comm.csv",
           "2003comm.csv","2004comm.csv","2005comm.csv","2006comm.csv",
           "2007comm.csv","2008comm.csv","2009comm.csv","2010comm.csv",
           "2011comm.csv","2012comm.csv","2013comm.csv","2014comm.csv",
           "2015comm.csv")
sources <- c('https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00731-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00729-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00727-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00725-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00723-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00721-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00719-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00717-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00715-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00714-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00711-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00709-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00702-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00733-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00735-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00737-P(CITYonlineDefault)&VariantId=3(CITYonlineDefault)',
             'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00739-P(CITYonlineDefault)&VariantId=2(CITYonlineDefault)'
)


censusCommunitySources <- data.frame(years,files,sources,stringsAsFactors = FALSE) 
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
#'
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
   for (i in 1:nrow(censusCommunitySources)) {
      targetFile=file.path(cacheDir,censusCommunitySources[i,]$files)
      if (! file.exists(targetFile)) { 
         download.file(censusCommunitySources[i,]$sources,
                       destfile=file.path(targetFile),
                       method="libcurl",
                       quiet = FALSE )
     }
   }
rawCommData<-mergeCensusCSV(cacheDir,'comm\\.csv')
return (rawCommData)
}


#rm (list=c("cacheRow","commURLS","wardURLS","i","targetFile"))
