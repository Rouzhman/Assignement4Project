## Post processing Description
The post processing was carried out to generate two tidy data sets using original data sets. To find information on the original data sets and the original features see the following two files:
* README-original.md
* features-original.md

## Procedure
An R script called run_analysis.R was written to perform the following 5 tasks to generate the two tidy data sets:
* task 1: Merge the training and the test sets (from the original data set) to create one data set.
* task 2: Extract only the measurements on the mean and standard deviation for each measurement.
* task 3: Use descriptive activity names to name the activities in the data set
* task 4: Appropriately label the data set with descriptive variable names. (This is the first new tidy data set)
* task 5: From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. (This is the second new tidy data set)

## Variable (Feature) information
The original data set included 561 features. Two new datasets were extracted, and in the new data sets a subset of the original features was extracted 
based on the following criteria: 
* task 2: only the measurements on the mean and standard deviation for each measurement were extracted

## feature units
* The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 
* The gyroscope units are rad/seg.

## Here are the list of features in both new data sets: 
Total number of columns in the new data sets is 89. Excluding the firts three columns (i.e. labelFactor, lebel, and subjectID), total number of variables is 86.
(it should be noted that in preparation of the second new data set, mean of each variable was calculated for each activity type and each subject according to the task 5 - see README for different tasks)
"1" "labelFactor"
"2" "label"
"3" "subjectID"
"4" "tBodyAcc-mean()-X"
"5" "tBodyAcc-mean()-Y"
"6" "tBodyAcc-mean()-Z"
"7" "tGravityAcc-mean()-X"
"8" "tGravityAcc-mean()-Y"
"9" "tGravityAcc-mean()-Z"
"10" "tBodyAccJerk-mean()-X"
"11" "tBodyAccJerk-mean()-Y"
"12" "tBodyAccJerk-mean()-Z"
"13" "tBodyGyro-mean()-X"
"14" "tBodyGyro-mean()-Y"
"15" "tBodyGyro-mean()-Z"
"16" "tBodyGyroJerk-mean()-X"
"17" "tBodyGyroJerk-mean()-Y"
"18" "tBodyGyroJerk-mean()-Z"
"19" "tBodyAccMag-mean()"
"20" "tGravityAccMag-mean()"
"21" "tBodyAccJerkMag-mean()"
"22" "tBodyGyroMag-mean()"
"23" "tBodyGyroJerkMag-mean()"
"24" "fBodyAcc-mean()-X"
"25" "fBodyAcc-mean()-Y"
"26" "fBodyAcc-mean()-Z"
"27" "fBodyAcc-meanFreq()-X"
"28" "fBodyAcc-meanFreq()-Y"
"29" "fBodyAcc-meanFreq()-Z"
"30" "fBodyAccJerk-mean()-X"
"31" "fBodyAccJerk-mean()-Y"
"32" "fBodyAccJerk-mean()-Z"
"33" "fBodyAccJerk-meanFreq()-X"
"34" "fBodyAccJerk-meanFreq()-Y"
"35" "fBodyAccJerk-meanFreq()-Z"
"36" "fBodyGyro-mean()-X"
"37" "fBodyGyro-mean()-Y"
"38" "fBodyGyro-mean()-Z"
"39" "fBodyGyro-meanFreq()-X"
"40" "fBodyGyro-meanFreq()-Y"
"41" "fBodyGyro-meanFreq()-Z"
"42" "fBodyAccMag-mean()"
"43" "fBodyAccMag-meanFreq()"
"44" "fBodyBodyAccJerkMag-mean()"
"45" "fBodyBodyAccJerkMag-meanFreq()"
"46" "fBodyBodyGyroMag-mean()"
"47" "fBodyBodyGyroMag-meanFreq()"
"48" "fBodyBodyGyroJerkMag-mean()"
"49" "fBodyBodyGyroJerkMag-meanFreq()"
"50" "angle(tBodyAccMean,gravity)"
"51" "angle(tBodyAccJerkMean),gravityMean)"
"52" "angle(tBodyGyroMean,gravityMean)"
"53" "angle(tBodyGyroJerkMean,gravityMean)"
"54" "angle(X,gravityMean)"
"55" "angle(Y,gravityMean)"
"56" "angle(Z,gravityMean)"
"57" "tBodyAcc-std()-X"
"58" "tBodyAcc-std()-Y"
"59" "tBodyAcc-std()-Z"
"60" "tGravityAcc-std()-X"
"61" "tGravityAcc-std()-Y"
"62" "tGravityAcc-std()-Z"
"63" "tBodyAccJerk-std()-X"
"64" "tBodyAccJerk-std()-Y"
"65" "tBodyAccJerk-std()-Z"
"66" "tBodyGyro-std()-X"
"67" "tBodyGyro-std()-Y"
"68" "tBodyGyro-std()-Z"
"69" "tBodyGyroJerk-std()-X"
"70" "tBodyGyroJerk-std()-Y"
"71" "tBodyGyroJerk-std()-Z"
"72" "tBodyAccMag-std()"
"73" "tGravityAccMag-std()"
"74" "tBodyAccJerkMag-std()"
"75" "tBodyGyroMag-std()"
"76" "tBodyGyroJerkMag-std()"
"77" "fBodyAcc-std()-X"
"78" "fBodyAcc-std()-Y"
"79" "fBodyAcc-std()-Z"
"80" "fBodyAccJerk-std()-X"
"81" "fBodyAccJerk-std()-Y"
"82" "fBodyAccJerk-std()-Z"
"83" "fBodyGyro-std()-X"
"84" "fBodyGyro-std()-Y"
"85" "fBodyGyro-std()-Z"
"86" "fBodyAccMag-std()"
"87" "fBodyBodyAccJerkMag-std()"
"88" "fBodyBodyGyroMag-std()"
"89" "fBodyBodyGyroJerkMag-std()"
