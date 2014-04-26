################################################################################### 
# Goal: 
# You should create one R script called run_analysis.R that does the following. 
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive activity names. 
# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
# Prerequisites: 
# - The code can be run as long as the Samsung data is in your working directory.
# 
# Project Repository
# - Github "https://github.com/cwerner13/UCIHAR_Smartphones" including
# - run_analysis.R (= this Pgm)
# - README.md (describes how the scripts are connected / work together)
# - CodeBook.md (describes data, variables, transformations)
#
# Ouput: 
# - The output should be the tidy data set you submitted for part 1.
###################################################################################

###################################################################################
# INIT  
###################################################################################

setwd("~/bianalyst/20140407 Data Science Track/UCIHAR")
options(stringsAsFactors = FALSE)

###################################################################################
# 1) Merges the training and the test sets to create one data set.
# 1a) Load data sets  (from folder "UCI HAR Dataset" in working directory)
# 1b) Concatenate Columns, Concatenate Rows
###################################################################################

# 1a) Load data sets 
X_train         = read.table("./UCI HAR Dataset/train/X_train.txt")             # 7352, 561
y_train         = read.table("./UCI HAR Dataset/train/y_train.txt")             # 7352, 1
subject_train   = read.table("./UCI HAR Dataset/train/subject_train.txt")       # 7352, 1 

X_test          = read.table("./UCI HAR Dataset/test/X_test.txt")               # 2947, 561
y_test          = read.table("./UCI HAR Dataset/test/y_test.txt")               # 2947, 1
subject_test    = read.table("./UCI HAR Dataset/test/subject_test.txt")         # 2947, 1 

# 1b) Concatenate Columns, Concatenate Rows
data    <- rbind( cbind(X_train, y_train, subject_train)
                , cbind(X_test , y_test,  subject_test ))
dim(data)                                                                       #10299, 563

################################################################################### 
# 4) Appropriately labels the data set with descriptive activity names. 
################################################################################### 

features           = read.table("./UCI HAR Dataset/features.txt")               #  561, 2
names(data)[1:561] = features[,2]
names(data)  [562] = "activity"
names(data)  [563] = "subject"

################################################################################### 
# 3) Uses descriptive activity names to name the activities in the data set
################################################################################### 

activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")           #    6, 2
data$activity   = factor(data$activity, labels=activity_labels[,2])

################################################################################### 
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
################################################################################### 

# match e.g. -mean()-Y, -mean(), but not Freqmean
toMatch         <- c(".*mean\\(\\)", ".*std\\(\\)")
matches         <- unique(grep(paste(toMatch, collapse="|")
                             , features$V2, value=TRUE))
sel             <- cbind(data[,matches], data[,562:563])

################################################################################### 
# 5) Creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject. 
################################################################################### 

require(reshape2)
molten          <- melt(sel, id= c("subject", "activity"), na.rm = TRUE)
tidy            <- dcast(molten, subject + activity ~ variable, fun.aggregate = mean)

write.table(x = tidy, file = "tidy.txt", sep="\t", quote=FALSE, qmethod = "escape",row.names = FALSE, col.names = TRUE)
