########################
# init.r
#
# Set up environment, retreive and merge data
#

require ("RCurl")
source ("../config.R")
# create the directory for cached data

if (file.exists(config$censusLocFile)) {
  censusURLS <- read.csv (config$censusLocFile,colClasses=c("integer","character","character"))
}
dir.create(file.path(config$cacheDir), showWarnings = FALSE)

for (i in 1:nrow(censusURLS)) {
     cacheRow <- censusURLS[i,]
     targetFile=file.path(config$cacheDir,cacheRow$fileLoc)
     if (file.exists(targetFile)) { 
       print (paste(targetFile, "exists - skipping"))
     } else {
       download.file(cacheRow$urlLoc,
                     destfile=file.path(targetFile),
                     method="libcurl")
     }
}
#setwd(file.path(mainDir, subDir))