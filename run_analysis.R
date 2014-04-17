## run_analysis.R
##
## Main program used to complete "Peer Assessments"/"Getting and Cleaning Data Project"
## 
## 1. Get preprocessed data frame dfTestX, dfTestY, dfTrainX, dfTrainY
## 2. Merge  Columns in dfTest<-cbind(dfTestY, dfTestX) and dfTrain<-cbind(dfTrainY, dfTrainX)
## 3. Merge  Rows in df <- rbind(dfTest,dfTrain)
## 4. dfTidyData <- Group df by activity or mean of means and sd.
## 5. Creates "./TidyData.txt". Mean feature values for each activity.
source("GetXDataFrame.R")
source("GetYDataFrame.R")
source("MyUnsplit.R")   

soureFolderUNC <- "./UCI HAR Dataset"  ## UNC of the source raw data.
tidyDataUNC <- "./TidyData.txt"

dfTestX <- GetXDataFrame(soureFolderUNC, "test") # dim 2947, 66
dfTestY <- GetYDataFrame(soureFolderUNC, "test") # dim 2947, 1
dfTrainX <- GetXDataFrame(soureFolderUNC, "train") # dim 7352, 66
dfTrainY <- GetYDataFrame(soureFolderUNC, "train") # dim 7352, 1

dfTest <- cbind(dfTestY, dfTestX) # dim 2947, 67
dfTrain <- cbind(dfTrainY, dfTrainX) # dim 7352, 67

df <- rbind(dfTest, dfTrain) # dim 10299, 67 

s <- split(df, df$Activity)
listMeans <- lapply(s, function(x) colMeans(x[,2:dim(df)[2]])) # vector[6] of data.frame
dfTidyData <- MyUnsplit(listMeans)
names(dfTidyData)[1] <- "Activity" # Rename column header "GroupName" to "Activity"

cat("Write ", "'", tidyDataUNC, "'", "\n", sep="")
write.table(dfTidyData, tidyDataUNC, sep=",", row.names=FALSE)

