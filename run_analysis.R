# The script below will perform the following steps
      # 1. Merges the training and the test sets to create one data set.
      # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
      # 3. Uses descriptive activity names to name the activities in the data set
      # 4. Appropriately labels the data set with descriptive variable names.
      # 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Before running this function, it is needed to download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# and to put this data in "./Data" directory
# The output data set will be created in the R Working Directory, as Average_features_per_subject.csv and Average_features_per_activity.csv
Coursera_project_2016_May <- function () {

      
      # First we do step 1, e.g. merge the train dataset and the test dataset
      
      
            # For the test dataset, we read the 3 files where the data is
            X_test <- read.table(file = "./Data/UCI HAR Dataset/test/X_test.txt")
            y_test <- read.table(file = "./Data/UCI HAR Dataset/test/y_test.txt")
            subject_test <- read.table(file = "./Data/UCI HAR Dataset/test/subject_test.txt")
            
            # We create the test dataset by combining the columns for each of the 3 tables we just read
            test_dataset <- cbind(X_test,y_test,subject_test)
            
            # For the train dataset, we read the 3 files where the data is
            X_train <- read.table(file = "./Data/UCI HAR Dataset/train/X_train.txt")
            y_train <- read.table(file = "./Data/UCI HAR Dataset/train/y_train.txt")
            subject_train <- read.table(file = "./Data/UCI HAR Dataset/train/subject_train.txt")
            
            # We create the train dataset by combining the columns for each of the 3 tables we just read
            train_dataset <- cbind(X_train,y_train, subject_train)
            
            # Now we combine the rows of the train dataset with the rows of the test dataset to get our complete dataset
            complete_dataset <- rbind(test_dataset,train_dataset)
      
            
      # Now that we have merged the dataset, we go to step 2, e.g. we will extract only the measurement on the mean and the standard deviation for each measurement


            # We extract the names of features in the 561-features vector
            features_names <- read.table(file= "./Data/UCI HAR Dataset/features.txt")
            
            # We look for the features regarding mean and standard deviation for each measurement
            # We look in the second column, because read.table function has created a two columns dataframe, with IDs of the features in the first column, and labels of the features in the second
            mean_std_features <- grep("mean\\(|std\\(",features_names[,2])
            
            # Now we subset the inputed dataset on the features regarding std or mean
            # We also keep the activity and the subject - which we added as last columns (562 and 563) in the function above
            complete_dataset <- complete_dataset[,c(mean_std_features,562,563)]
      

      # Step 2 is over, let's move to step 3, e.g. create a column with the activity label


            # We read the activity labels
            activity_labels <- read.table(file = "./Data/UCI HAR Dataset/activity_labels.txt")
            
            # We merge the input data frame with the activity labels
            dataset_activity_labels <- merge(x= complete_dataset,y = activity_names,by.x = c(67),by.y = c(1), all.x = TRUE)


      # Step 3 is over, we will now move to step 4, e.g. label the data set with descriptive variable names

            # We read the feature names
            features_names <- read.table(file= "./Data/UCI HAR Dataset/features.txt")
            
            # We look for the features regarding mean and standard deviation for each measurement
            # We look in the second column, because read.table function has created a two columns dataframe, with IDs of the features in the first column, and labels of the features in the second 
            mean_std_features <- grep("mean\\(|std\\(",features_names[,2], value = TRUE)
            
            # Thanks to the names function, we can give new names to the variables
            names(dataset_activity_labels) <- c("ActivityCode",mean_std_features,"SubjectID","ActivityLabel")
      
      # Step 4 is over, we move to step 5, e.g. create an independent tidy data set with the average of each variable for each activity and each subject
            
            library(dplyr)
            library(reshape2)

            # We do a split/sapply operation
            s <- split(dataset_activity_labels,list(dataset_activity_labels$ActivityLabel,dataset_activity_labels$SubjectID))
            s <- sapply(s, function(x) colMeans(x[,c(2:67)]))
            
            # This then needs to be put into a data frame, so that we can use all the nice functions accessible for data frames
            s <- data.frame(s)
            
            # Currently the name of the features are directly in the index, which is not convenient, so we create a column with the feature names
            s <- mutate(s,id = rownames(s))
            
            # We use the melt function to have one tidy data set with one variable per column
            smelt <- melt(s,id = "id", measure.vars=c(1:180))
            
            # We convert the variable column (that includes all activity X Subject ID) to characters, as they are currently factors
            smelt$variable <- as.character(smelt$variable)
            
            # We split the activit X Subject ID into two columns, and remove the initial column
            smelt <- mutate(smelt, activity = substr(smelt$variable,start= 1, stop = nchar(smelt$variable)-2))
            smelt <- mutate(smelt, subject = substr(smelt$variable,start= nchar(smelt$variable), stop = nchar(smelt$variable)))
            smelt <- smelt[,c(1,3,4,5)]
            
            names(smelt) <- c("feature","value","activity","subjectID")
            smelt <- smelt[,c(1,3,4,2)]
            write.table(smelt, file = "./Average_features_per_activity_and_subject.txt",row.name = FALSE)
            
            
}
