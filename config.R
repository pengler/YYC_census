config = rev(within(list(), {
  baseDir      = "/home/pengler/Projects/YYC_census"
  zipSrc       = "http://www.example.com/remote_data_file.zip"
  data_dir     = "data"
  data_zip     = "data.zip"
  data_txt     = "data.txt"
  cacheDir     = file.path(baseDir,"cache")
  configDir    = file.path(baseDir,"config")
  scriptDir    = file.path(baseDir, "scripts")
  libDir       = file.path(baseDir, "lib")
  graphDir     = file.path(baseDir, "graphDir")
  censusLocFile = file.path (configDir,"census_sources.csv")
}))