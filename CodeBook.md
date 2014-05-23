Purpose of Document
==================
This document describes the variables from the file "tidyData.txt""

Description of Variables
====================

The data set contains 68 variables:

* "subject"  : The subject for which the measurements were taken
* "activity" : The activity a subject was doing, while the measurements were taken. Possible values are:
 * WALKING
 * WALKING_UPSTAIRS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING
* The other 66 variables are the averages (per person and per activity) of  measurements coming from the accelerators of a smartphone while a person does certain activities. The values come from the data files subject_train.txt and subject_test.txt and were take unchanged.
Only 66 values were retained, which are the "mean" and "standard deviation" columns from the file.
The column names consist of three parts:
  * which sensor (accelerator)
  * which statistic (mean or standard deviation)
  * which axes (X,Y or Z)
  
 The variable names have been converted to a more readable format, for example:
  "tBodyAcc-mean()-X"   --> "tBodyAcc.mean.X" 
  
  * tBodyAcc.mean.X
   * tBodyAcc.mean.Y
   * tBodyAcc.mean.Z
   * tBodyAcc.std.X
   * tBodyAcc.std.Y
   * tBodyAcc.std.Z
   * tGravityAcc.mean.X
   * tGravityAcc.mean.Y
   * tGravityAcc.mean.Z
   * tGravityAcc.std.X
   * tGravityAcc.std.Y
   * tGravityAcc.std.Z
   * tBodyAccJerk.mean.X
   * tBodyAccJerk.mean.Y
   * tBodyAccJerk.mean.Z
   * tBodyAccJerk.std.X
   * tBodyAccJerk.std.Y
   * tBodyAccJerk.std.Z
   * tBodyGyro.mean.X
   * tBodyGyro.mean.Y
   * tBodyGyro.mean.Z
   * tBodyGyro.std.X
   * tBodyGyro.std.Y
   * tBodyGyro.std.Z
   * tBodyGyroJerk.mean.X
   * tBodyGyroJerk.mean.Y
   * tBodyGyroJerk.mean.Z
   * tBodyGyroJerk.std.X
   * tBodyGyroJerk.std.Y
   * tBodyGyroJerk.std.Z
   * tBodyAccMag.mean
   * tBodyAccMag.std
   * tGravityAccMag.mean
   * tGravityAccMag.std
   * tBodyAccJerkMag.mean
   * tBodyAccJerkMag.std
   * tBodyGyroMag.mean
   * tBodyGyroMag.std
   * tBodyGyroJerkMag.mean
   * tBodyGyroJerkMag.std
   * fBodyAcc.mean.X
   * fBodyAcc.mean.Y
   * fBodyAcc.mean.Z
   * fBodyAcc.std.X
   * fBodyAcc.std.Y
   * fBodyAcc.std.Z
   * fBodyAccJerk.mean.X
   * fBodyAccJerk.mean.Y
   * fBodyAccJerk.mean.Z
   * fBodyAccJerk.std.X
   * fBodyAccJerk.std.Y
   * fBodyAccJerk.std.Z
   * fBodyGyro.mean.X
   * fBodyGyro.mean.Y
   * fBodyGyro.mean.Z
   * fBodyGyro.std.X
   * fBodyGyro.std.Y
   * fBodyGyro.std.Z
   * fBodyAccMag.mean
   * fBodyAccMag.std
   * fBodyBodyAccJerkMag.mean
   * fBodyBodyAccJerkMag.std
   * fBodyBodyGyroMag.mean
   * fBodyBodyGyroMag.std
   * fBodyBodyGyroJerkMag.mean
   * fBodyBodyGyroJerkMag.std
 
Description of data transformations 
===========================
 
 The data set was obtained from the original data by the following operations: (for detail see the R code in run_analysis.R)
 
 1. Reading  data from  file X_train.txt in folder "train"
 2. Adding column "subject" coming from file "subject_train.txt"  and converting it to a factor with levels 1 to 30
 3. Adding column "activity" coming from file y_train.txt and converting it to a factor
 4. Doing steps 1-3 for the data in folder "test"
 5. Combining the data sets obtained in steps 1-3  and 4 row-wise
 6. Retain only the columns with the "standard deviation" and "mean" measurements (and "subject" and "activity")
 7. Creating a new data set from the data set of step 6 by averaging all measurements grouped by subject and activity
 8. Sorting the data set by subject and activity
 9. The final data set is called "data.tidy" in the R code
 
Further information 
=======================

Further information is available here:
* https://class.coursera.org/getdata-003/human_grading/view/courses/972136/assessments/3/submissions
* Original data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .
  It contains descriptions of the data inside.
