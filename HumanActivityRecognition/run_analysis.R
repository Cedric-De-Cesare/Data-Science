# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Note: The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# 1. Merges the training and the test sets to create one data set.
temp1 <- read.table("train/X_train.txt")
temp2 <- read.table("test/X_test.txt")
X <- rbind(temp1, temp2)

temp1 <- read.table("train/subject_train.txt")
temp2 <- read.table("test/subject_test.txt")
S <- rbind(temp1, temp2)

temp1 <- read.table("train/y_train.txt")
temp2 <- read.table("test/y_test.txt")
Y <- rbind(temp1, temp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
indices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices]
names(X) <- features[indices, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Labels the data set with descriptive activity names.
names(S) <- "subject"
tableCleaned <- cbind(S, Y, X)
write.table(tableCleaned, "result_merged_clean_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(tableCleaned)[2]
result = tableCleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- tableCleaned[tableCleaned$subject==s & tableCleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "result_tidy_dataset.txt", row.name=FALSE)