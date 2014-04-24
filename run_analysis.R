## run_analysis.R
##
## Main program used to complete "Peer Assessments"/"Getting and Cleaning Data Project"
## 
## 1. Get preprocessed data frame dfTestX, dfTestY, dfTrainX, dfTrainY
## 2. Merge  Columns in dfTest<-cbind(dfTestY, dfTestX) and dfTrain<-cbind(dfTrainY, dfTrainX)
## 3. Merge  Rows in df <- rbind(dfTest,dfTrain)
## 4. dfTidyData <- $Activity, $SubjectID, "-mean", "-std" features.
## 5. Creates "./TidyData.txt". Clean merged combined data
## 6. Creates "./Averages.txt". Mean feature values for each $Activity+$Subject.
library("plyr")
source("GetXDataFrame.R")
source("GetYDataFrame.R")
source("GetSubjectIDDataFrame.R")
source("MyUnsplit.R")   

soureFolderUNC <- "./UCI HAR Dataset"  ## UNC of the source raw data.
tidyDataUNC <- "./TidyData.txt" # Clean Data
averagesUNC <- "./Averages.txt" # Mean of features by $Activity+$Subject

dfTestX <- GetXDataFrame(soureFolderUNC, "test") # dim 2947, 66
dfTestY <- GetYDataFrame(soureFolderUNC, "test") # dim 2947, 1
dfTestSubjectID <- GetSubjectIDDataFrame(soureFolderUNC, "test") # dim 2947, 1
dfTrainX <- GetXDataFrame(soureFolderUNC, "train") # dim 7352, 66
dfTrainY <- GetYDataFrame(soureFolderUNC, "train") # dim 7352, 1
dfTrainSubjectID <- GetSubjectIDDataFrame(soureFolderUNC, "train") # dim 7352, 1

dfTest <- cbind(dfTestY, dfTestSubjectID, dfTestX) # dim 2947, 1+1+66=68
dfTrain <- cbind(dfTrainY, dfTrainSubjectID, dfTrainX) # dim 7352, 1+1+66=68

dfTidyData <- rbind(dfTest, dfTrain) # dim 10299, 68 1=$Activity, 2=$SubjectID, 3..68=$Feature(s)

# Create TidyData.txt
cat("Write ", "'", tidyDataUNC, "'", "\n", sep="")
write.table(dfTidyData, tidyDataUNC, sep=",", row.names=FALSE)

# Create Averages.txt mean over $Activity,$SubjectID
split.by <- c("Activity", "SubjectID")
s <- split(dfTidyData, dfTidyData[, split.by])
colRange <- 3:dim(dfTidyData)[2] # Features Only (not $Activity, $SubjectID)
listMeans <- lapply(s, function(x) colMeans(x[,colRange])) # vector[6] of data.frame
dfAverages <- MyUnsplit(listMeans)
names(dfAverages)[1] <- "Activity.SubjectID" # Rename column header "GroupName" to "Activity.SubjectID"
dfAverages$Activity.SubjectID <- as.character(dfAverages$Activity.SubjectID) # Convert "Activity.SubjectID" to a string (not a factor)
listKey2 <- strsplit(as.character(dfAverages$Activity.SubjectID), "[.]") # Split $Activity.SubjectID
dfKey2 <- ldply(listKey2) # Convert listKey2 into a data frame.
names(dfKey2) <- c("Activity", "SubjectID")
dfKey2$SubjectID <- as.integer(dfKey2$SubjectID) # Convert $SubjectID to integer for sorting
dfAverages <- cbind(dfKey2, dfAverages[,2:dim(dfAverages)[2]]) # Dim 180, 68
dfAverages.sort <- dfAverages[order(dfAverages$Activity, dfAverages$SubjectID), ]

cat("Write ", "'", averagesUNC, "'", "\n", sep="")
write.table(dfAverages.sort, averagesUNC, sep=",", row.names=FALSE)

