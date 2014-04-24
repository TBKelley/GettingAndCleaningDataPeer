## run_analysis.R
##
## Main program used to complete "Peer Assessments"/"Getting and Cleaning Data Project"
## 
## 1. Get preprocessed data frame dfTestX, dfTestY, dfTrainX, dfTrainY
## 2. Merge  Columns in dfTest<-cbind(dfTestY, dfTestX) and dfTrain<-cbind(dfTrainY, dfTrainX)
## 3. Merge  Rows in df <- rbind(dfTest,dfTrain)
## 4. dfTidyData <- Group df by activity or mean of means and sd.
## 5. Creates "./TidyData.txt". Mean feature values for each $Activity.
## 6. Creates "./TidyData2.txt". Mean feature values for each $Activity+$Subject.
library("plyr")
source("GetXDataFrame.R")
source("GetYDataFrame.R")
source("GetSubjectIDDataFrame.R")
source("MyUnsplit.R")   

soureFolderUNC <- "./UCI HAR Dataset"  ## UNC of the source raw data.
tidyData1UNC <- "./TidyData1.txt" # Mean of features by $Activity
tidyData2UNC <- "./TidyData2.txt" # Mean of features by $Activity+$Subject

dfTestX <- GetXDataFrame(soureFolderUNC, "test") # dim 2947, 66
dfTestY <- GetYDataFrame(soureFolderUNC, "test") # dim 2947, 1
dfTestSubjectID <- GetSubjectIDDataFrame(soureFolderUNC, "test") # dim 2947, 1
dfTrainX <- GetXDataFrame(soureFolderUNC, "train") # dim 7352, 66
dfTrainY <- GetYDataFrame(soureFolderUNC, "train") # dim 7352, 1
dfTrainSubjectID <- GetSubjectIDDataFrame(soureFolderUNC, "train") # dim 7352, 1

dfTest <- cbind(dfTestY, dfTestSubjectID, dfTestX) # dim 2947, 1+1+66=68
dfTrain <- cbind(dfTrainY, dfTrainSubjectID, dfTrainX) # dim 7352, 1+1+66=68

df <- rbind(dfTest, dfTrain) # dim 10299, 68 1=$Activity, 2=$SubjectID, 3..68=$Feature(s)

# Create TidyData1 mean over $Activity
s <- split(df, df$Activity)
colRange <- 3:dim(df)[2] # Features Only (not $Activity, $SubjectID)
listMeans <- lapply(s, function(x) colMeans(x[,colRange])) # vector[6] of data.frame
dfTidyData1 <- MyUnsplit(listMeans)
names(dfTidyData1)[1] <- "Activity" # Rename column header "GroupName" to "Activity"

cat("Write ", "'", tidyData1UNC, "'", "\n", sep="")
write.table(dfTidyData1, tidyData1UNC, sep=",", row.names=FALSE)

# Create TidyData2 mean over $Activity,$SubjectID
split.by <- c("Activity", "SubjectID")
s <- split(df, df[, split.by])
colRange <- 3:dim(df)[2] # Features Only (not $Activity, $SubjectID)
listMeans <- lapply(s, function(x) colMeans(x[,colRange])) # vector[6] of data.frame
dfTidyData2 <- MyUnsplit(listMeans)
names(dfTidyData2)[1] <- "Activity.SubjectID" # Rename column header "GroupName" to "Activity.SubjectID"
dfTidyData2$Activity.SubjectID <- as.character(dfTidyData2$Activity.SubjectID) # Convert "Activity.SubjectID" to a string (not a factor)
listKey2 <- strsplit(as.character(dfTidyData2$Activity.SubjectID), "[.]") # Split $Activity.SubjectID
dfKey2 <- ldply(listKey2) # Convert listKey2 into a data frame.
names(dfKey2) <- c("Activity", "SubjectID")
dfKey2$SubjectID <- as.integer(dfKey2$SubjectID) # Convert $SubjectID to integer for sorting
dfTidyData2 <- cbind(dfKey2, dfTidyData2[,2:dim(dfTidyData2)[2]]) # Dim 180, 68
dfTidyData2.sort <- dfTidyData2[order(dfTidyData2$Activity, dfTidyData2$SubjectID), ]

cat("Write ", "'", tidyData2UNC, "'", "\n", sep="")
write.table(dfTidyData2.sort, tidyData2UNC, sep=",", row.names=FALSE)

