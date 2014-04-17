## MyUnsplit.R
##
## Convert a lapply(split(df,f), function...) group by list structure back to a data.form
##
## listGroupBy: Example:
## $LAYING
## tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z  tBodyAcc-std()-X  tBodyAcc-std()-Y  tBodyAcc-std()-Z 
## 0.26864864       -0.01831773       -0.10743563       -0.96093241       -0.94350719       -0.94806930 
##
## $SITTING
## tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z  tBodyAcc-std()-X  tBodyAcc-std()-Y  tBodyAcc-std()-Z 
## 0.27305961       -0.01268957       -0.10551700       -0.98344622       -0.93488056       -0.93898158 
##
## USAGE:
##  listMeans <- lapply(s, function(x) colMeans(x[,2:dim(df)[2]]))
##  dfTidyData <- MyUnsplit(listMeans)
##
## RETURN: data.frame example:
##  GroupName tBodyAcc-mean()-X tBodyAcc-mean()-Z ...
##  LAYING    0.26864864        -0.01831773       ...
##  SITTING   0.26864864        -0.01268957       ...
##
## DESIGN: Cache "activity_labels.txt" so repeat calls do not have to re-read file.
MyUnsplit <- function(listGroupBy) {
    df <- data.frame()
    groupNames <- names(listGroupBy)
    for (groupName in groupNames) {
        dfTmp <- data.frame(t(data.frame(listGroupBy[groupName]))) # 
        dfTmp <- cbind(GroupName=rownames(dfTmp), dfTmp) # Convert groupName row name as the GroupName column
        rownames(dfTmp) <- NULL # Set rownames to 1, 2, 3, ...
        df <- rbind(df, dfTmp) # Append means row for GroupName
    }
    df
}