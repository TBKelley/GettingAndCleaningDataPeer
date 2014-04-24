## GetSubjectIDDataFrame.R
##
## Get a "SubjectID" data frame from "UCI HAR Dataset".
##
## folderUNC:   Source root folder for "UCI HAR Dataset"
##              Example: "./UCI HAR Dataset"
## dataType:    Type of data. Example: "test" or "train"
##
## Returns Data Frame with the following columns:
# 1 SubjectID

source("GetFileUNC.R")

GetSubjectIDDataFrame <- function(folderUNC, dataType) {

    filename <- paste("subject_", dataType, ".txt", sep="")
    fileUNC <- GetFileUNC(paste(folderUNC, dataType, sep="/"), filename)
    
    cat("Read ", "'", fileUNC, "'", "\n", sep="")
    df <- read.table(fileUNC, header=FALSE) # 1 Columns
    names(df) <- "SubjectID"

    df
}