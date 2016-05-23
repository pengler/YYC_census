# Track the mix of residence types since 1999
#
# Full field definitons located at: 
# http://www.calgary.ca/CA/city-clerks/Documents/Election-and-information-services/Census2015/2015%20Census%20Terms%20and%20Definitions.pdf
# 
# Fields: 
# DWELL_CNT - total # od dwellings
# SING_FAMLY - Single famity residences
# DUPLEX - Originally built to contain 2 dwellings
# MULTI_PLEX - Originally built to contain at least 3 dwellings on 1-2 levels
# APARTMENT - Originally built to contain at least 3 dwellings on 3+ levels
# TOWN_HOUSE - Originally built to conatin 3+ attached or semi-detached
# CONV_STRUC - Converted - more units than orignally designed for
# RES_COMM - Primarily commercial with 1-2 residental
# OTHER_RES - Does not fit above definitions
# NURSING_HM - Nursing Home

require ("ggplot2")
source (file.path(config$libDir,"helpers.R"))

if (!exists("config")) {source ("../config.R") }
if (!exists("rawCensusData")) { source (file.path(config$libDir,"init.R"))}

commData <- rawCensusData[rawCensusData$COMM_CODE==config$communityCode,]

p <- ggplot(commData, aes(CNSS_YR)) + 
  geom_line(aes(y=SING_FAMLY, colour="Single Family")) +
  geom_line(aes(y=DUPLEX, colour="Duplex")) +
  geom_line(aes(y=MULTI_PLEX, colour="Multiplex")) +
  geom_line(aes(y=APARTMENT, colour="Apartment")) +
  geom_line(aes(y=CONV_STRUC, colour="Converted Struct")) +
  labs(title=paste(toLongName(config$communityCode), "Structure Types"))+
  labs(x="Census Year")+
  labs(y="Structure Count")+ 
  labs(colour="Struct Type")
  theme_set(theme_gray(base_size = config$baseFontSize))
  print(p)

  if (config$saveGraphs == TRUE ) { 
    png(filename=graphName("res_struct_type"), 
    width = config$plotWidth, 
    height = config$plotHeight)
    plot(p)
    dev.off()
}