# Content of this repo
This repo contains the following elements:
* a codebook: CodeBook.md
* a dataset of one table: Average_features_per_activity_and_subject.txt
* a R script: run_analysis.R
* a README file: README.md

The codebook describes the dataset and the dataset is the output of the script.
The script will create the dataset in the R working directory.

Prior to executing the script, you should download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and put this data in "./Data" within your R working directory.

# More information about the data set and the script
## About the original data
In a few words, the script realizes data treatment on the original data set.

The original data has been collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.  
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

Please note that there is a specific documentation regarding the original data set, which is included in the web link above. You can also check the following web site to have more insights about the project : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## About the treatment carried out on the original data by the script
The treatment follows the steps below:
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The CodeBook.md provides the details about the data set.

