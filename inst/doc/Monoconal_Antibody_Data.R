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

## -----------------------------------------------------------------------------
library(DataSpaceR)
con <- connectDS()

DT::datatable(con$mabGridSummary, options = list(autoWidth = TRUE, scrollX = TRUE))

## -----------------------------------------------------------------------------
# filter the grid by viruses
con$filterMabGrid(using = "virus", value = c("242-14", "Q23.17", "6535.3", "BaL.26", "DJ263.8"))

# filter the grid by donor species (llama)
con$filterMabGrid(using = "donor_species", value = "llama")

# check the updated grid
DT::datatable(con$mabGridSummary, options = list(autoWidth = TRUE, scrollX = TRUE))

## ----eval=FALSE---------------------------------------------------------------
#  con$
#    filterMabGrid(using = "hxb2_location", value = c("Env", "gp160"))$
#    filterMabGrid(using = "donor_species", value = "llama")$
#    mabGridSummary

## -----------------------------------------------------------------------------
# retrieve available viruses in the filtered grid
con$mabGrid[, unique(virus)]

# retrieve available clades for 1H9 mAb mixture in the filtered grid
con$mabGrid[mab_mixture == "1H9", unique(clade)]

## -----------------------------------------------------------------------------
mab <- con$getMab()
mab

## -----------------------------------------------------------------------------
DT::datatable(mab$nabMab, options = list(autoWidth = TRUE, scrollX = TRUE))

## -----------------------------------------------------------------------------
names(mab)

## ----session-info-------------------------------------------------------------
sessionInfo()

