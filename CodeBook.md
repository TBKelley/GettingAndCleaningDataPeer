# TidyData1.txt #

Mean values of "-mean", "-std" feature measurments by "Activity".

This document describes the variables, the data, and any transformations or work that you performed 
to clean up the data from "UCI HAR Dataset" X_test.txt, Y_test.TXT, X_train.txt, Y_train.TXT into TidyData.txt

Details of the meaning of each measurement can be found in features_info.txt

## File Format ##

TidyData1.txt is a comma separated file, easily read by R and Excel.

## Column Variable ##

Each feature is the mean of the raw values grouped over Activity.

Activity : "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()

## Transformation ##

NOTE: No missing values were found.

Only mean and standard deviation measurments have been selected from the combined raw X_test.txt, Y_test.TXT, X_train.txt, Y_train.TXT files.

Y_train.TXT + X_train.txt
Y_test.TXT  + X_test.txt

All files were appended into a full data frame.
A mean of "measurment features" are taken over "Activity".

Some manipulation was required to convert named lists back to a data.frame.
the "lapply" over the split() data had to be transposed to make row names into a data frame column.

The final summary data.frame 6*67 was saved as a CSV file.




# TidyData2.txt #

Mean values of "-mean", "-std" feature measurments by "Activity", "SubjectID".

This document describes the variables, the data, and any transformations or work that you performed 
to clean up the data from "UCI HAR Dataset" X_test.txt, Y_test.TXT, X_train.txt, Y_train.TXT into TidyData.txt

Details of the meaning of each measurement can be found in features_info.txt


## File Format ##

TidyData2.txt is a comma separated file, easily read by R and Excel.

## Column Variable ##

Each feature is the mean of the raw values grouped over Activity.

Activity : "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"
SubjectID : Subject ID from subject_train.txt, subject_test.txt
tBodyAcc-mean()-X
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()

## Transformation ##

NOTE: No missing values were found.

Only mean and standard deviation measurments have been selected from the combined raw Y_test.TXT, subject_test.txt, X_test.txt, Y_train.TXT, subject_train.txt, X_train.txt files.

Y_train.TXT + subject_test.txt + X_train.txt
Y_test.TXT  + subject_train.txt + X_test.txt

All files were appended into a full data frame.
A mean of "measurment features" are taken over "Activity","SubjectID".

Some manipulation was required to convert named lists back to a data.frame.
the "lapply" over the split() data had to be transposed to make row names into a data frame column.

Issues were encountered to split on two columns. A new combined factor column "Activity.SubjectID" had to be created.
Other issues were encountered splitting "Activity.SubjectID" back to a character "Activity" column and integer "SubjectID" column, required for proper sorting.

The final summary data.frame 6*68 was saved as a CSV file.