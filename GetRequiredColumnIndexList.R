## GetRequiredColumnIndexList.R
##
## Get a list of "-mean()", "-std()" feature index.
##
## USAGE:
##  listRequiredColumnIndex <- GetRequiredColumnIndexList("./UCI HAR Dataset")
##
source("GetFileUNC.R")

GetRequiredColumnIndexList <- function(folderUNC) {
    fileUNC <- GetFileUNC(folderUNC, "features.txt")
    cat("Read ", "'", fileUNC, "'", "\n", sep="")

    dfFeatures <- read.csv(fileUNC, sep=" ", header=FALSE, col.names=c("Index", "Name"))
    
    vecMeanIndex <- grep("-mean[(])", dfFeatures$Name)
    vecStdIndex <- grep("-std[(])", dfFeatures$Name)
    
    listRequiredColumnIndex <- c(vecMeanIndex, vecStdIndex)
    
    listRequiredColumnIndex
}