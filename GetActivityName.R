## GetActivityName.R
##
## Convert a Activity Enum to an Activity name. Using "activity_labels.txt"
##
## USAGE:
##  getActivityName <- make.GetActivityName("./UCI HAR Dataset")
##  activityName <- getActivityName(1)
##
##  getActivityName(df$ActivityEnum)
##
## DESIGN: Cache "activity_labels.txt" so repeat calls do not have to re-read file.
source("GetFileUNC.R")

make.GetActivityName <- function(folderUNC) {
    
    ## Cache "features.txt" as a character vector.
    fileUNC <- GetFileUNC(folderUNC, "activity_labels.txt")
    cat("Read ", "'", fileUNC, "'", "\n", sep="")
    vecActivityName <- read.table(fileUNC, header=FALSE, sep=" ", colClasses=c("integer",  "character"))[[2]]
    
    GetActivityName <- function(activityEnum) {
        vecActivityName[activityEnum]
    }
    GetActivityName
}