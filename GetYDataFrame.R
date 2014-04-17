## GetYDataFrame.R
##
## Get a Y data frame of "UCI HAR Dataset".
##
## folderUNC:   Source root folder for "UCI HAR Dataset"
##              Example: "./UCI HAR Dataset"
## dataType:    Type of data. Example: "test" or "train"
##
## Returns Data Frame.
## $Activity=Factor
source("GetActivityName.R")
source("GetFileUNC.R")

GetYDataFrame <- function(folderUNC, dataType) {
    getActivityName <- make.GetActivityName(folderUNC)
    
    filename <- paste("Y_", dataType, ".txt", sep="")
    fileUNC <- GetFileUNC(paste(folderUNC, dataType, sep="/"), filename)
    
    cat("Read ", "'", fileUNC, "'", "\n", sep="")
    df <- read.csv(fileUNC, header=FALSE, col.names=c("Activity"))
    
    Activity <- getActivityName(df$Activity)
    df <- data.frame(Activity) ## df$Activity column of factor

    df
}