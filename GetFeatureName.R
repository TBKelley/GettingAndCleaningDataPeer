## GetFeatureName.R
##
## Convert a Feature index to a feature name. Using "features.txt"
##
## USAGE:
##  getFeatureName <- make.GetFeatureName(""./UCI HAR Dataset"")
##  featureName <- getFeatureName(1)
##
##  featureNames <- getActivityName(c(1, 2, 5))
##
## DESIGN: Cache "features.txt" so repeat calls do not have to re-read file.
source("GetFileUNC.R")

make.GetFeatureName <- function(folderUNC) {
    
    ## Cache "features.txt" as a character vector.
    fileUNC <- GetFileUNC(folderUNC, "features.txt")
    cat("Read ", "'", fileUNC, "'", "\n", sep="")
    vecFeatureName <- read.table(fileUNC, header=FALSE, sep=" ", colClasses=c("integer",  "character"))[[2]]
    
    GetFeatureName <- function(featureIndex) {
        vecFeatureName[featureIndex]
    }
    GetFeatureName
}