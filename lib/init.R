########################
# init.r
#
# Set up environment, retreive and merge data
#

require ("RCurl")
require ("data.table")
if (!exists("config")) {source ("../config.R") }


load_data <- function(path,csvpattern) { 
  files <- dir(path, pattern = csvpattern, full.names = TRUE)
  tables <- lapply(files, read.csv)
  rbindlist(tables, fill=TRUE)
}

# create the directory for cached data
dir.create(file.path(config$cacheDir), showWarnings = config$verbose)

# get sources for by community census data
if (file.exists(config$commLocFile)) {
  commURLS <- read.csv (config$commLocFile,colClasses=c("integer","character","character"))
}

# get sources for by ward community census data
if (file.exists(config$wardLocFile)) {
  wardURLS <- read.csv (config$wardLocFile,colClasses=c("integer","character","character"))
}


# todo: get rid of for loop and make this more R like
for (i in 1:nrow(commURLS)) {
     cacheRow <- commURLS[i,]
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

# todo: horrible cut an paste code
for (i in 1:nrow(wardURLS)) {
  cacheRow <- wardURLS[i,]
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

rawCommData<-load_data(config$cacheDir,'comm\\.csv')
rawWardData<-load_data(config$cacheDir,'ward\\.csv')


rm (list=c("cacheRow","commURLS","wardURLS","i","targetFile"))
