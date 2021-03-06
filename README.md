# GettingAndCleaningDataPeer #


John Hopkins Getting and Cleaning Data peer review assignment

Code can be found at https://github.com/TBKelley/GettingAndCleaningDataPeer.git

## Installed Packages ##

"plyr"

## Code Call Tree ##

run_analysis.R
  |
  +-> GetXDataFrame.R
  |    |
  |    +-> GetRequiredColumnIndexList.R
  |    |    |
  |    |    +-> GetFileUNC.R
  |    |
  |    +-> GetFeatureName.R
  |    |    |
  |    |    +-> GetFileUNC.R
  |    |
  |    +-> GetFileUNC.R
  |
  +-> GetYDataFrame.R
  |    |
  |    +-> GetActivityName.R
  |    |    |
  |    |    +-> GetFileUNC.R
  |    |
  |    +-> GetFileUNC.R
  |
  +-> GetSubjectIDDataFrame.R
  |    |
  |    +-> GetFileUNC.R
  |
  +-> GetAveragesDataFrame.R

## run_analysis.R ##

Main controller.
1. Get preprocessed data frame dfTestX, dfTestY, dfTestSubjectID, dfTrainX, dfTrainY, dfTrainSubjectID
2. Merge  Columns in dfTest<-cbind(dfTestY, dfTestSubjectID, dfTestX) and dfTrain<-cbind(dfTrainY, dfTrainSubjectID, dfTrainX)
3. Merge  Rows in df <- rbind(dfTest,dfTrain)
5. Creates a CSV file "./TidyData.txt".

6. dfAverage <- Group df by "Activity", "SubjectID" or averages of "-means" and "-std" measuerment features.
7. Convert "Activity" to character and "SubjectID" to integer for sorting results.
8. Creates a CSV file "./Average.txt". Averages of feature values grouped by "Activity", "SubjectID".
 

## GetXDataFrame.R ##

GetXDataFrame (folderUNC, dataType)

Get a filtered X data frame of "UCI HAR Dataset".

folderUNC:   Source root folder for "UCI HAR Dataset"
              Example: "./UCI HAR Dataset"
dataType:    Type of data. Example: "test" or "train"

NOTE: Extracts only the measurements on the mean and standard deviation for each measurement.

Returns Data Frame with the following columns:
  1 tBodyAcc-mean()-X
  2 tBodyAcc-mean()-Y
  3 tBodyAcc-mean()-Z
  4 tBodyAcc-std()-X
  5 tBodyAcc-std()-Y
  6 tBodyAcc-std()-Z
 41 tGravityAcc-mean()-X
 42 tGravityAcc-mean()-Y
 43 tGravityAcc-mean()-Z
 44 tGravityAcc-std()-X
 45 tGravityAcc-std()-Y
 46 tGravityAcc-std()-Z
 81 tBodyAccJerk-mean()-X
 82 tBodyAccJerk-mean()-Y
 83 tBodyAccJerk-mean()-Z
 84 tBodyAccJerk-std()-X
 85 tBodyAccJerk-std()-Y
 86 tBodyAccJerk-std()-Z
 121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()

## GetYDataFrame.R ##

GetYDataFrame(folderUNC, dataType)

Get a Y data frame of "UCI HAR Dataset".

folderUNC:   Source root folder for "UCI HAR Dataset"
             Example: "./UCI HAR Dataset"
dataType:    Type of data. Example: "test" or "train"

Returns Data Frame.
$Activity=Factor

## GetRequiredColumnIndexList.R ##

GetRequiredColumnIndexList(folderUNC)

Get a list of "-mean()", "-std()" feature index.
NOTE: -meanfreq() is NOT selected.

USAGE:
listRequiredColumnIndex <- GetRequiredColumnIndexList("./UCI HAR Dataset")


## GetFeatureName.R ##

GetFeatureName(featureIndex)
Convert a Feature index to a feature name. Using "features.txt"

USAGE:
  getFeatureName <- make.GetFeatureName(""./UCI HAR Dataset"")
  featureName <- getFeatureName(1)

  featureNames <- getActivityName(c(1, 2, 5))

DESIGN: Cache "features.txt" so repeat calls do not have to re-read file.

## GetActivityName.R ##

GetActivityName(activityEnum)

Convert a Activity Enum to an Activity name. Using "activity_labels.txt"

USAGE:
 getActivityName <- make.GetActivityName(""./UCI HAR Dataset"")
 activityName <- getActivityName(1)

 getActivityName(df$ActivityEnum)

DESIGN: Cache "activity_labels.txt" so repeat calls do not have to re-read file.

## GetFileUNC.R ##

GetFileUNC(folderUNC, filename)

Get fileUNC by first looking in . then folderUNC if not found.

Used to resolve assignment ambiguity of if "data files are in the working directory".
Does that mean the data folder or are the files to be moved from the download structure.

folderUNC:   Source root folder for "UCI HAR Dataset"
             Example: "./UCI HAR Dataset"
filename:    Example: X_train.txt

Returns verified file UNC


## GetAveragesDataFrame.R ##

GetAveragesDataFrame(df, listGroupBy)

Create a data frame of avarages of numeric columns grouped by columns in listGroupBy




