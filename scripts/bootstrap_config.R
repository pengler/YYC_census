#
# require ("devtools")
# Year <- 1999:2015
# File <- c("1999comm.csv","2000comm.csv","2001comm.csv","2002comm.csv",
#            "2003comm.csv","2004comm.csv","2005comm.csv","2006comm.csv",
#            "2007comm.csv","2008comm.csv","2009comm.csv","2010comm.csv",
#            "2011comm.csv","2012comm.csv","2013comm.csv","2014comm.csv",
#            "2015comm.csv")
# HTTPSource <- c('https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00731-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00729-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00727-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00725-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00723-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00721-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00719-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00717-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00715-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00714-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00711-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00709-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00702-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00733-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00735-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00737-P(CITYonlineDefault)&VariantId=3(CITYonlineDefault)',
#              'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00739-P(CITYonlineDefault)&VariantId=2(CITYonlineDefault)'
# )
# 
# 
# YYCCensusCommSRC <- data.frame(Year,File,HTTPSource,stringsAsFactors = FALSE)
# devtools::use_data(YYCCensusCommSRC,internal = TRUE , overwrite = TRUE)
# File <- c("1999ward.csv","2000ward.csv","2001ward.csv","2002ward.csv",
#           "2003ward.csv","2004ward.csv","2005ward.csv","2006ward.csv",
#           "2007ward.csv","2008ward.csv","2009ward.csv","2010ward.csv",
#           "2011ward.csv","2012ward.csv","2013ward.csv","2014ward.csv",
#           "2015ward.csv")
# 
# HTTPSource <- c('https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00732-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00730-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00728-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00726-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00724-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00722-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00720-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00718-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00716-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00713-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00712-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00710-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00708-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00734-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00736-P(CITYonlineDefault)&VariantId=4(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00738-P(CITYonlineDefault)&VariantId=3(CITYonlineDefault)',
#                 'https://data.calgary.ca/_layouts/OpenData/DownloadDataset.ashx?DatasetId=PDC0-99999-99999-00740-P(CITYonlineDefault)&VariantId=2(CITYonlineDefault)'
#                 )
# 
# YYCCensusWardSRC <- data.frame(Year,File,HTTPSource,stringsAsFactors = FALSE)
# devtools::use_data(YYCCensusWardSRC,internal = TRUE , overwrite = TRUE)
