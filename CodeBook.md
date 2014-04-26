Code Book
========================================================

### Introduction
In the field of wearable computing companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users [1]. The data we analyze in 
this context  is collected from the Samsung Galaxy S smartphone

### Variables
The [Human Activity Recognition] experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually [2].

Each record provides these measurements aggregate by subject and activity:

- activity label. 
- identifier of the subject who carried out the experiment.
- 66-feature vector averageing the domain variables. 

Variable Name  | Description 
-------------- | ------------
"subject"       | identifier of the subject who carried out the experiment
"activity"       | activity label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
"tBodyAcc-mean()-X"  | Mean value, averaged     
"tBodyAcc-mean()-Y"  | Mean value, averaged            
"tBodyAcc-mean()-Z"  | Mean value, averaged            
"tBodyAcc-std()-X"   | Standard deviation, averaged        
"tBodyAcc-std()-Y"   | Standard deviation, averaged         
"tBodyAcc-std()-Z"   | Standard deviation, averaged         
"tGravityAcc-mean()-X" | Mean value, averaged          
"tGravityAcc-mean()-Y" | Mean value, averaged           
"tGravityAcc-mean()-Z" | Mean value, averaged           
"tGravityAcc-std()-X"  | Standard deviation, averaged       
"tGravityAcc-std()-Y"  | Standard deviation, averaged       
"tGravityAcc-std()-Z"  | Standard deviation, averaged       
"tBodyAccJerk-mean()-X" | Mean value, averaged      
"tBodyAccJerk-mean()-Y" | Mean value, averaged      
"tBodyAccJerk-mean()-Z" | Mean value, averaged      
"tBodyAccJerk-std()-X"  | Standard deviation, averaged     
"tBodyAccJerk-std()-Y"  | Standard deviation, averaged      
"tBodyAccJerk-std()-Z"  | Standard deviation, averaged      
"tBodyGyro-mean()-X"    | Mean value, averaged     
"tBodyGyro-mean()-Y"    | Mean value, averaged      
"tBodyGyro-mean()-Z"    | Mean value, averaged      
"tBodyGyro-std()-X"     | Standard deviation, averaged     
"tBodyGyro-std()-Y"     | Standard deviation, averaged      
"tBodyGyro-std()-Z"     | Standard deviation, averaged      
"tBodyGyroJerk-mean()-X" | Mean value, averaged    
"tBodyGyroJerk-mean()-Y" | Mean value, averaged     
"tBodyGyroJerk-mean()-Z" | Mean value, averaged    
"tBodyGyroJerk-std()-X"  | Standard deviation, averaged    
"tBodyGyroJerk-std()-Y"  | Standard deviation, averaged     
"tBodyGyroJerk-std()-Z"  | Standard deviation, averaged     
"tBodyAccMag-mean()"     | Mean value, averaged    
"tBodyAccMag-std()"      | Standard deviation, averaged     
"tGravityAccMag-mean()"  | Mean value, averaged       
"tGravityAccMag-std()"   | Standard deviation, averaged    
"tBodyAccJerkMag-mean()" | Mean value, averaged      
"tBodyAccJerkMag-std()"  | Standard deviation, averaged     
"tBodyGyroMag-mean()"    | Mean value, averaged      
"tBodyGyroMag-std()"      | Standard deviation, averaged    
"tBodyGyroJerkMag-mean()" | Mean value, averaged     
"tBodyGyroJerkMag-std()"  | Standard deviation, averaged   
"fBodyAcc-mean()-X"       | Mean value, averaged    
"fBodyAcc-mean()-Y"       | Mean value, averaged    
"fBodyAcc-mean()-Z"       | Mean value, averaged   
"fBodyAcc-std()-X"        | Standard deviation, averaged    
"fBodyAcc-std()-Y"        | Standard deviation, averaged    
"fBodyAcc-std()-Z"        | Standard deviation, averaged   
"fBodyAccJerk-mean()-X"   | Mean value, averaged    
"fBodyAccJerk-mean()-Y"   | Mean value, averaged   
"fBodyAccJerk-mean()-Z"   | Mean value, averaged   
"fBodyAccJerk-std()-X"    | Standard deviation, averaged    
"fBodyAccJerk-std()-Y"    | Standard deviation, averaged    
"fBodyAccJerk-std()-Z"    | Standard deviation, averaged   
"fBodyGyro-mean()-X"      | Mean value, averaged    
"fBodyGyro-mean()-Y"      | Mean value, averaged    
"fBodyGyro-mean()-Z"      | Mean value, averaged   
"fBodyGyro-std()-X"       | Standard deviation, averaged    
"fBodyGyro-std()-Y"       | Standard deviation, averaged    
"fBodyGyro-std()-Z"       | Standard deviation, averaged   
"fBodyAccMag-mean()"     | Mean value, averaged     
"fBodyAccMag-std()"      | Standard deviation, averaged     
"fBodyBodyAccJerkMag-mean()" | Mean value, averaged 
"fBodyBodyAccJerkMag-std()"  | Standard deviation, averaged 
"fBodyBodyGyroMag-mean()"    | Mean value, averaged 
"fBodyBodyGyroMag-std()"     | Standard deviation, averaged
"fBodyBodyGyroJerkMag-mean()" | Mean value, averaged
"fBodyBodyGyroJerkMag-std()" | Standard deviation, averaged



### Data
#### Raw Data
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.[2] Therefore the orignal data include the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

which we  clean up, concatenate and aggregate into one tidy data set
- 'tidy.txt': Tidy set

### Transformation Steps


#### 1) Merges the training and the test sets to create one data set.
1a) Load data sets  (from folder "UCI HAR Dataset" in working directory)
1b) Concatenate Columns, Concatenate Rows



```r
# 1a) Load data sets
X_train = read.table("./UCI HAR Dataset/train/X_train.txt")  # 7352, 561
y_train = read.table("./UCI HAR Dataset/train/y_train.txt")  # 7352, 1
subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt")  # 7352, 1 

X_test = read.table("./UCI HAR Dataset/test/X_test.txt")  # 2947, 561
y_test = read.table("./UCI HAR Dataset/test/y_test.txt")  # 2947, 1
subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt")  # 2947, 1 

# 1b) Concatenate Columns, Concatenate Rows
data <- rbind(cbind(X_train, y_train, subject_train), cbind(X_test, y_test, 
    subject_test))
dim(data)  #10299, 563
```

```
## [1] 10299   563
```


#### 4) Appropriately labels the data set with descriptive activity names.


```r
features = read.table("./UCI HAR Dataset/features.txt")  #  561, 2
names(data)[1:561] = features[, 2]
names(data)[562] = "activity"
names(data)[563] = "subject"
```


#### 3) Uses descriptive activity names to name the activities in the data set


```r
activity_labels = read.table("./UCI HAR Dataset/activity_labels.txt")  #    6, 2
data$activity = factor(data$activity, labels = activity_labels[, 2])
```


#### 2) Extracts only the measurements on the mean and standard deviation for each measurement. 


```r
# match e.g. -mean()-Y, -mean(), but not Freqmean
toMatch <- c(".*mean\\(\\)", ".*std\\(\\)")
matches <- unique(grep(paste(toMatch, collapse = "|"), features$V2, value = TRUE))
sel <- cbind(data[, matches], data[, 562:563])
```

```

```


#### 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


```r
require(reshape2)
molten <- melt(sel, id = c("subject", "activity"), na.rm = TRUE)
tidy <- dcast(molten, subject + activity ~ variable, fun.aggregate = mean)
```

```r

write.table(x = tidy, file = "tidy.txt", sep = "\t", quote = FALSE, qmethod = "escape", 
    row.names = FALSE, col.names = TRUE)
```

```

```


#### References: 
[1] Getting and Cleaning Data, Johns Hopkins University, URL: https://www.coursera.org/course/getdata  
[2] Human Activity Recognition Using Smartphones Data Set, URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
[3] Data for the project, URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
[4] Tidy data set code book, URL: https://github.com/cwerner13/UCIHAR_Smartphones/blob/master/CodeBook.md  
