require ("ggplot2")

if (!exists("config")) {source ("../config.R") }
if (!exists("rawCensusData")) { source (file.path(config$libDir,"init.R"))}

HPK <- rawCensusData[rawCensusData$COMM_CODE=="HPK",]
p <- ggplot(HPK, aes(CNSS_YR)) + 
  geom_line(aes(y=RES_CNT, colour="RES_CNT")) +
  geom_line(aes(y=DWELL_CNT, colour="DWELL_CNT"))
  

print (p)