## GetAveragesDataFrame.R
##
## Get a data frame of averages of all numeric columns of df, grouped by listGroupBy.
##
## df:           A tydy data frame with GroupBy Columns and numeric columns to be averaged.
## listGroupBy:  A list of column names. Avarages will be by these idenity columns
##               Example: c("Activity", "SubjectID")
##
## Returns Data Frame with the following columns:
## GroupBy columns, Averaged numeric columns
library("plyr")

GetAveragesDataFrame <- function(df, listGroupBy) {
    keyCount <- length(listGroupBy)
    s <- split(df, df[, listGroupBy])
    colRange <- 3:dim(df)[2] # Features Only (not $Activity, $SubjectID)
    listMeans <- lapply(s, function(x) colMeans(x[,colRange])) # vector[6] of data.frame
    dfAverages <-ldply(listMeans) # The col=1 will be a factor or the listGroupBy columns.
    names(dfAverages)[1] <- "GroupByKey" # Rename sort by column to "GroupByKey"

    dfAverages # 180,67 GroupByKey chr, num .... Example: GroupByKey: chr  "LAYING.1" "SITTING.1" "STANDING.1" "WALKING.1" ...

    listKeys <- strsplit(as.character(dfAverages$GroupByKey), "[.]") # Split $GroupByKey conatinated value into separate values.
    dfKeys <- ldply(listKeys) # Convert listKeys into a data frame.
    names(dfKeys) <- listGroupBy
    dfAverages <- cbind(dfKeys, dfAverages[,keyCount:dim(dfAverages)[keyCount]]) # Dim 180, 68
    
    #dfKey2$SubjectID <- as.integer(dfKey2$SubjectID) # Convert $SubjectID to integer for sorting
    dfAverages
}