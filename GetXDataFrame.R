## GetXDataFrame.R
##
## Get a filtered X data frame of "UCI HAR Dataset".
##
## folderUNC:   Source root folder for "UCI HAR Dataset"
##              Example: "./UCI HAR Dataset"
## dataType:    Type of data. Example: "test" or "train"
##
## Returns Data Frame with the following columns:
# 1 tBodyAcc-mean()-X
# 2 tBodyAcc-mean()-Y
# 3 tBodyAcc-mean()-Z
# 4 tBodyAcc-std()-X
# 5 tBodyAcc-std()-Y
# 6 tBodyAcc-std()-Z
# 41 tGravityAcc-mean()-X
# 42 tGravityAcc-mean()-Y
# 43 tGravityAcc-mean()-Z
# 44 tGravityAcc-std()-X
# 45 tGravityAcc-std()-Y
# 46 tGravityAcc-std()-Z
# 81 tBodyAccJerk-mean()-X
# 82 tBodyAccJerk-mean()-Y
# 83 tBodyAccJerk-mean()-Z
# 84 tBodyAccJerk-std()-X
# 85 tBodyAccJerk-std()-Y
# 86 tBodyAccJerk-std()-Z
# 121 tBodyGyro-mean()-X
# 122 tBodyGyro-mean()-Y
# 123 tBodyGyro-mean()-Z
# 124 tBodyGyro-std()-X
# 125 tBodyGyro-std()-Y
# 126 tBodyGyro-std()-Z
# 161 tBodyGyroJerk-mean()-X
# 162 tBodyGyroJerk-mean()-Y
# 163 tBodyGyroJerk-mean()-Z
# 164 tBodyGyroJerk-std()-X
# 165 tBodyGyroJerk-std()-Y
# 166 tBodyGyroJerk-std()-Z
# 201 tBodyAccMag-mean()
# 202 tBodyAccMag-std()
# 214 tGravityAccMag-mean()
# 215 tGravityAccMag-std()
# 227 tBodyAccJerkMag-mean()
# 228 tBodyAccJerkMag-std()
# 240 tBodyGyroMag-mean()
# 241 tBodyGyroMag-std()
# 253 tBodyGyroJerkMag-mean()
# 254 tBodyGyroJerkMag-std()
# 266 fBodyAcc-mean()-X
# 267 fBodyAcc-mean()-Y
# 268 fBodyAcc-mean()-Z
# 269 fBodyAcc-std()-X
# 270 fBodyAcc-std()-Y
# 271 fBodyAcc-std()-Z
# 345 fBodyAccJerk-mean()-X
# 346 fBodyAccJerk-mean()-Y
# 347 fBodyAccJerk-mean()-Z
# 348 fBodyAccJerk-std()-X
# 349 fBodyAccJerk-std()-Y
# 350 fBodyAccJerk-std()-Z
# 424 fBodyGyro-mean()-X
# 425 fBodyGyro-mean()-Y
# 426 fBodyGyro-mean()-Z
# 427 fBodyGyro-std()-X
# 428 fBodyGyro-std()-Y
# 429 fBodyGyro-std()-Z
# 503 fBodyAccMag-mean()
# 504 fBodyAccMag-std()
# 516 fBodyBodyAccJerkMag-mean()
# 517 fBodyBodyAccJerkMag-std()
# 529 fBodyBodyGyroMag-mean()
# 530 fBodyBodyGyroMag-std()
# 542 fBodyBodyGyroJerkMag-mean()
# 543 fBodyBodyGyroJerkMag-std()

source("GetFeatureName.R")
source("GetFileUNC.R")

GetXDataFrame <- function(folderUNC, dataType) {
    getFeatureName <- make.GetFeatureName(folderUNC)
    requiredColIndex <- c(1,2,3,4,5,6, 41,42,3,44,45,46, 81,82,93,84,85,86,
                          121,122,123,124,125,126, 161,162,163,164,165,166,
                          201,202, 214,215, 227,228, 240,241, 253,254, 266,267,268,269,270,271,
                          345,346,347,348,349,350, 424,425,426,427,428,429, 503,504,
                          516, 517, 529,530, 542,543)

    requiredColNames <- getFeatureName(requiredColIndex) # Example: c('tBodyAcc-mean()-X', ...'fBodyBodyGyroJerkMag-std()')

    filename <- paste("X_", dataType, ".txt", sep="")
    fileUNC <- GetFileUNC(paste(folderUNC, dataType, sep="/"), filename)
    
    cat("Read ", "'", fileUNC, "'", "\n", sep="")
    df <- read.table(fileUNC, header=FALSE) # 561 Columns
    df <- df[requiredColIndex]
    names(df) <- requiredColNames

    df
}