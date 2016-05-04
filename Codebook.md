# getting-and-cleaning-data-final-project

This is a code book that describes the variables, the data, and any transformations or work that I've performed to clean up the data.

***
As is required by course project, this R script "run_analysis.R" that does the following.

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

***

###Dataset Introduction

Source: [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
is collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

***
###Files included
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training activity labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test activity labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

######Note: All the files in train/Inertial Signals and test/Inertial Signals will not be used for in this analysis
***
###Details aboout each file
####Common Files: 
feature.txt: 561 rows of 2 variables (feature identifier and feature name)
activity_labels.txt: 6 rows of 2 variables (activity identifier and activity name)
####Test Dataset:
X_Test.txt: 2947 rows of 561 measurement variables. These measurement variables are listed in feature.txt.
y_Test.txt: 2947 rows of 1 variable. This is activity identifier.
subject_test.txt: 2947 rows of 1 variable. This is subject identifier.
####Training Dataset:
X_Train.txt: 7352 rows of 561 measurement variables. These measurement variables are listed in feature.txt.
y_Train.txt: 7352 rows of 1 variable. This is activity identifier.
subject_train.txt: 7352 rows of 1 variable. This is subject identifier.


###Detailed Functions of "run_analysis.R" Script
- Download and extrat the raw data
- Install.packages("dplyr")
- Create a function used to mutate txt. files in both training and test datasets and to create data frames 
- Merges the training and the test sets to create one data set through rbind function.
- Read the feature labels in features.txt and mutate each label with a varname according to its serial number
- Use filter function to select only feature labels that contain mean or std (case insensitive) AND not angle measurements
- Use select function to Select certain rows of data with required feature labels and corresponding subject and activity
- Read the activity labels and transform the activity column into a factor using factor function and mutate function
- Launch "data.table" package and appropriately labels the data set with descriptive variable names using setnames function
- Launch "reshape2" package to use melt function to group the data by activity and subject
- Then use dcast function to cast a molten data frame into a new data frame called mean.data
- Transform the variable names of mean.data















 
