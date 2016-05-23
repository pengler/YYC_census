config = rev(within(list(), {
  baseDir      = "/home/pengler/Projects/YYC_census"
  cacheDir     = file.path(baseDir, "cache")
  configDir    = file.path(baseDir, "config")
  scriptDir    = file.path(baseDir, "scripts")
  libDir       = file.path(baseDir, "lib")
  graphDir     = file.path(baseDir, "graphs")
  verbose      = TRUE
  commLocFile = file.path (configDir,"community_census_sources.csv")
  wardLocFile = file.path (configDir,"ward_census_sources.csv")
  savePlot = FALSE
  communityCode = "HPK"
  plotWidth = 640
  plotHeight = 400
  baseFontSize = 18
}))