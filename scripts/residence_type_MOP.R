# Track the mix of residence types since 1999 for Mount Pleasant
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

if (!exists("config")) {source ("../config.R") }
if (!exists("rawCensusData")) { source (file.path(config$libDir,"init.R"))}

MOP <- rawCensusData[rawCensusData$COMM_CODE=="MOP",]

p <- ggplot(MOP, aes(CNSS_YR)) + 
  geom_line(aes(y=SING_FAMLY, colour="Single Family")) +
  geom_line(aes(y=DUPLEX, colour="Duplex")) +
  geom_line(aes(y=MULTI_PLEX, colour="Multiplex")) +
  geom_line(aes(y=APARTMENT, colour="Apartment")) +
  geom_line(aes(y=CONV_STRUC, colour="Converted Struct")) +
  labs(title="Mount Pleasant Structure Types")+
  labs(x="Census Year")+
  labs(y="Structure Count")+ 
  labs(colour="Struct Type")
  theme_set(theme_gray(base_size = 18))
  print(p)

  #geom_line(aes(y=TOWN_HOUSE, colour="TOWN_HOUSE")) +
  #geom_line(aes(y=RES_COMM, colour="RES_COMM")) +
  #geom_line(aes(y=OTHER_RES, colour="OTHER_RES")) +
  #geom_line(aes(y=NURSING_HM, colour="NURSING_HM"))
png(filename="test.png", width = 640, height= 400)
plot(p)
dev.off()
