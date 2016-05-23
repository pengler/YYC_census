#######################################
# toLongName (code)
# requires the three letter community code as listed in COMM_CODE
# field of the data set
#
# Returns the full name of the community 
# 
# eg. HPK  returns HIGHLAND PARK
toLongName <- function(code) {
  code <- as.character(code)
  if (exists("rawCensusData")) {
    longName <- as.character(
      rawCensusData[rawCensusData$COMM_CODE==code,]$NAME[1]
    )
  } else {
    longName <- "No matching community code"
  }
  longName <- simpleCap(longName)
  return (longName)
}

#######################################
# toCommCode (code)
# requires the full community name as listed in NAMES
# field of the data set
#
# Returns the community code 
# 
# eg. HIGHLAND PARK returns HPK
toCommCode <- function(commName) {
  commName <- toupper(as.character(commName))
  if (exists("rawCensusData")) {
    shortName<- as.character(
      rawCensusData[rawCensusData$NAME==commName,]$COMM_CODE[1]
    )
  } else {
    shortName <- "XXX"
  }
  return (shortName)
}

#######################################
# simpleCap (x)
#
# Simple fuction to capitalize the first letter of a word
#
# Copied from: http://stackoverflow.com/questions/6364783/capitalize-the-first-letter-of-both-words-in-a-two-word-string
simpleCap <- function(x) {
  x <- tolower(x)
  s <- strsplit(x, " ")[[1]]
  paste(toupper(substring(s, 1,1)), substring(s, 2),
        sep="", collapse=" ")
}

#######################################
# graphName (gName)
# 
# Produce the file name for the graph to be output
# name will be prepended with Community Shorr Code
# and assumes the file type is png
#
graphName <- function (gName) {
  gName <- paste (gName,config$communityCode,sep="_")
  gName <- paste (gName,"png",sep=".")
  gName <- file.path (config$graphDir,gName)
  if (config$verbose == TRUE) {print (gName)}
  return (gName)
}

#######################################
# getCommunityCodes (df)
#
# returns a list of community codes based on the data frame passed in
#
getCommunityCodes <- function (df=rawCensusData) {
  codes <- as.vector(unique(df$COMM_CODE))
  return(codes)
  
}
#######################################
# getCommunityNames (df)
#
# returns a list of community codes based on the data frame passed in
#
getCommunityNames <- function (df=rawCensusData) {
  names <- as.vector(unique(df$NAME))
  return(names)
}

#######################################
# getCommunityClasses (df)
#
# returns a list of community codes based on the data frame passed in
#
getCommunityClasses <- function (df=rawCensusData) {
  classes <- as.vector(unique(df$CLASS))
  return(classes)
}

########################################
# getCensusYears (df)
#
# returns a list of census years bases on the data frame passed in
#
getCensusYears <- function (df=rawCensusData) {
  years <- as.vector(unique(df$CNSS_YR))
  return(years)
}

#######################################
# savePlot (p,pName="MyPlot)
savePlot <- function (p,pName="MyPlot") {
  png(filename=graphName(pName), 
      width = config$plotWidth, 
      height = config$plotHeight)
  plot(p)
  dev.off()
}
