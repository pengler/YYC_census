########################
# init.r
#
# Set up environment, retreive and merge data
#

require ("RCurl")
require ("data.table")
if (!exists("config")) {source ("../config.R") }


load_data <- function(path) { 
  files <- dir(path, pattern = '\\.csv', full.names = TRUE)
  tables <- lapply(files, read.csv)
  rbindlist(tables, fill=TRUE)
}

# create the directory for cached data

if (file.exists(config$censusLocFile)) {
  censusURLS <- read.csv (config$censusLocFile,colClasses=c("integer","character","character"))
}
dir.create(file.path(config$cacheDir), showWarnings = config$verbose)


# todo: get rid of for loop and make this more R like
for (i in 1:nrow(censusURLS)) {
     cacheRow <- censusURLS[i,]
     targetFile=file.path(config$cacheDir,cacheRow$fileLoc)
     if (file.exists(targetFile)) { 
       if (config$verbose == TRUE ) {
         print (paste(targetFile, "exists - skipping"))
       }
     } else {
       download.file(cacheRow$urlLoc,
                     destfile=file.path(targetFile),
                     method="libcurl",
                     quiet = !(config$verbose))
     }
}
rm (list=c("cacheRow","censusURLS","i","targetFile"))
rawCensusData<-load_data(config$cacheDir)
