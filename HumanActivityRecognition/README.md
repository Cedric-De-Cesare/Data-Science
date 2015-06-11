
Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The folder contains 1 method called run_analysis.R that does the following. 
- 1) Merges the training and the test sets to create one data set.
- 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
- 3) Uses descriptive activity names to name the activities in the data set
- 4) Appropriately labels the data set with descriptive variable names. 
- 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps to reproduce
- 1) Unzip the file getdata-projectfiles-UCI HAR Dataset.zip
- 2) Set up your working directory so it points to the UCI HAR Dataset folder
- 3) Run the run_analysis.R script.

### Outputs
The output are ```result_merged_clean_data.txt``` and ```result_tidy_dataset.txt```.
