########################
# init.r
#
# Set up environment, retreive and merge data
#

require ("RCurl")

# create the directory for cached data
currDir <- getwd()
cacheDir <- file.path (currDir, "cache" )
configDir <- file.path (currDir, "config")
censusLocFile <- file.path (configDir,"census_sources.csv")

if (file.exists(censusLocFile)) {
   censusURLS <- read.csv (censusLocFile,colClasses=c("integer","character","character"))
}

dir.create(file.path(cacheDir), showWarnings = FALSE)

with(censusURLS, 
     download.file(urlLoc,
                   destfile=file.path(cacheDir,fileLoc),
                   method="libcurl")
)     
#setwd(file.path(mainDir, subDir))