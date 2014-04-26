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
source("GetXDataFrame.R")
source("GetYDataFrame.R")
source("GetSubjectIDDataFrame.R")
source("GetAveragesDataFrame.R")

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

# dfAverages data frame the averages of numeric columns over $Activity,$SubjectID
listGroupBy <- c("Activity", "SubjectID")
dfAverages <- GetAveragesDataFrame(dfTidyData, listGroupBy)

# Sort dfAverages by $Activity,$SubjectID to standardise output
dfAverages$SubjectID <- as.integer(dfAverages$SubjectID) # Convert $SubjectID to integer for sorting
dfAverages.sort <- dfAverages[order(dfAverages$Activity, dfAverages$SubjectID), ]

# Create Averages.txt
cat("Write ", "'", averagesUNC, "'", "\n", sep="")
write.table(dfAverages.sort, averagesUNC, sep=",", row.names=FALSE)

