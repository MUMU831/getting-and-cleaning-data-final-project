# getting-and-cleaning-data-final-project
>This README file explains details of the analysis files.
***
####Data source
Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

***
####Files included in repo
-run_analysis.R
-Codebook.md
-README.md

***
####Functions of script "run_analysis.R" 

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

***
####Running the script
To run the script, you just have to download the script and source the script from your working directory in R.
source(run_analysis.R)

***
####Details of Codebook.md
The code book file describes the variables, the data, and any transformations and work performed to clean up the data

