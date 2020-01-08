## ---- echo = FALSE, warning=FALSE, message=FALSE------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
STAGING <- identical(tolower(Sys.getenv("STAGING")), "true")
labkey.url.base <- ifelse(STAGING, "https://dataspace-staging.cavd.org", "https://dataspace.cavd.org")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----getStudy-----------------------------------------------------------------
library(DataSpaceR)
con <- connectDS()
vtn505 <- con$getStudy("vtn505")
vtn505

## ----availableStudies---------------------------------------------------------
knitr::kable(vtn505$availableDatasets)

## ----getDataset---------------------------------------------------------------
adcp <- vtn505$getDataset("ADCP")
dim(adcp)
colnames(adcp)

## ----getDatasetDescription, eval = FALSE--------------------------------------
#  vtn505$getDatasetDescription("ADCP")

## ----setDataDir---------------------------------------------------------------
vtn505$dataDir
vtn505$setDataDir(".")
vtn505$dataDir

## ----session-info-------------------------------------------------------------
sessionInfo()

