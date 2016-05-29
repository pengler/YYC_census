#######################################
# Collection of helper functions for
# maniplulating the per community census
# data set



#######################################
#' toLongName Convert three letter community code to full name
#
#' @param df dataframe with census data
#' @param code three letter community code
#' @export
#' @examples toLongName (censusDF,"HPK")
#' toLongName(myDF,core)
toLongName <- function(myDF,code) {
  code <- as.character(code)
  longName <- as.character(myDF[myDF$COMM_CODE==code,]$NAME[1])
  if (is.na(longName)) {
    longName <- "No matching community code"
  }
  longName <- simpleCap(longName)
  
  return (longName)
}

#######################################
#' toCommCode Covert Community Name to Short Code
# 
# eg. HIGHLAND PARK returns HPK
#' @param df dataframe with census data
#' @param commName string containing the community name
#' @export
#' @examples toCommCode (censusDF,"Highland Park")
#' toCommCode (myDF,commName)
toCommCode <- function(censusDF, commName) {
  commName <- toupper(as.character(commName))
  if (exists("censusDF")) {
    shortName<- as.character(
      censusDF[censusDF$NAME==commName,]$COMM_CODE[1]
    )
  } else {
    shortName <- "XXX"
  }
  return (shortName)
}



#######################################
#' getCommunityCodes returns a list of community codes 
#
#' returns the list of community codes contained with in 
#' the data frame that is passes in
#'
#' @param cencusDF dataframe with census data
#' @export
#' @examples getCommunityCodes (censusDF )
#' getCommunityCodes (df)
getCommunityCodes <- function (censusDF) {
  codes <- as.vector(unique(censusDF$COMM_CODE))
  return(codes)
  
}
#######################################
#' getCommunityNames returns a list of community names 
#
#' returns the list of community codes contained with in 
#' the data frame that is passes in
#'
#' @param cencusDF dataframe with census data
#' @export
#' @examples getCommunityNames (censusDF )
#' getCommunityNames (df)
getCommunityNames <- function (censusDF) {
  names <- as.vector(unique(censusDF$NAME))
  return(names)
}
#######################################
#' getCommunityClasses returns a list of community names 
#
#' returns the list of community classes contained with in 
#' the data frame that is passes in
#'
#' @param cencusDF dataframe with census data
#' @export
#' @examples getCommunityClasses (censusDF )
#' getCommunityClasses (df)

getCommunityClasses <- function (censusDF) {
  classes <- as.vector(unique(censusDF$CLASS))
  return(classes)
}


#######################################
#' getCensusYears returns a list of community names 
#
#' returns the list of census years contained with in 
#' the data frame that is passes in
#'
#' @param cencusDF dataframe with census data
#' @export
#' @examples getCensusYears (censusDF )
#' getCensusYears (df)
#' 
getCensusYears <- function (censusDF) {
  years <- as.vector(unique(censusDF$CNSS_YR))
  return(years)
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
# savePlot (p,pName="MyPlot)
savePlot <- function (p,pName="MyPlot") {
  png(filename=graphName(pName), 
      width = config$plotWidth, 
      height = config$plotHeight)
  plot(p)
  dev.off()
}
