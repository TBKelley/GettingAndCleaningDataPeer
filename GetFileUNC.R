## GetFileUNC.R
##
## Get fileUNC by first looking in . then folderUNC if not found.
##
## Used to resolve assignment ambiguity of if "data files are in the working directory".
## Does that mean the data folder or are the files to be moved from the download structure.
##
## folderUNC:   Source root folder for "UCI HAR Dataset"
##              Example: "./UCI HAR Dataset"
## filename:    Example: X_train.txt
##
## Returns verified file UNC
GetFileUNC <- function(folderUNC, filename) {
    fileUNC = paste(".", filename, sep="/")
    if (file.exists(fileUNC)) {
        return(fileUNC)
    }
    
    fileUNC = paste(folderUNC, filename, sep="/")
    if (file.exists(fileUNC)) {
        return(fileUNC)
    }
    
    stop(paste(fileUNC, "not found", sep=" "))
}

