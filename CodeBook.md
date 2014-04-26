Code Book
========================================================

### Introduction
In the field of wearable computing companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.[1] The data we analyze in 
this context  is collected from the Samsung Galaxy S smartphone

### Variables
The [Human Activity Recognition] experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.[2]

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


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

### Transformations

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 




```r
summary(tidy)
```

```
## Error: object 'tidy' not found
```


You can also embed plots, for example:


```r
plot(cars)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


#### References: 
[1] Getting and Cleaning Data, Johns Hopkins University, URL: https://www.coursera.org/course/getdata  
[2]Human Activity Recognition Using Smartphones Data Set, URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
[3] Data for the project, URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
[4] Tidy data set code book, URL: https://github.com/cwerner13/UCIHAR_Smartphones/blob/master/CodeBook.md  
