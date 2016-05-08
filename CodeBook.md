# Information about the original data

## Where to find the original data
The data set is derived from the data available at the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Please note that a full description is available at this site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## What the original data is about
Briefly, the original data has been collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

For each record, following information is available:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables.

For each of this information, please note that pre-processing has been applied, and that features are normalized and bounded within [-1,1].

# Information about the data set

This data set contains one table as txt file: 
* Average_features_per_activity_and_subject.txt


This table includes the mean and the standard deviation for the following 33 variables (N.B.: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions): 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The values have been averaged for each of the 30 *subjects* and each of the 6 *activities*.  
So totally, in the table, there are 30 subjects x 6 activities x 33 variables x 2 treatments (either mean or standard deviation), e.g. 11,880 rows.  