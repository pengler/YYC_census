# Simple template to get started building other graphs. 

# Environment Setup 
require ("ggplot2")
source (file.path(config$libDir,"helpers.R"))

if (!exists("config")) {source ("../config.R") }
if (!exists("rawCensusData")) { source (file.path(config$libDir,"init.R"))}

# Overwrite some config defaults 
config$communityCode = "BLN" #Beltline
config$savePlot = FALSE

# grab some data from the raw data set
commData <- rawCensusData[rawCensusData$COMM_CODE==config$communityCode,]

# compare dwellings vs residents
p <- ggplot(commData, aes(CNSS_YR)) + 
  geom_line(aes(y=RES_CNT, colour="Residents")) +
  geom_line(aes(y=DWELL_CNT, colour="Dwellings")) +
  labs(title=paste(toLongName(config$communityCode), "Dwelling and Residents"))+
  labs(x="Census Year")+
  labs(y="Number")+ 
  labs(colour="")
theme_set(theme_gray(base_size = config$baseFontSize))

print (p)

if (config$savePlot == TRUE ) { 
  savePlot (p,pName="dwell_vs_res")
}