#### Getting and Cleaning Data Project Assignment
setwd("~/R/Work in progress/UCI HAR Dataset")
library(plyr)

# Step 1 -  Merge the training and test sets to create one data set
###############################################################################

# create 'x' data set
x_train <- read.table("train/X_train.txt")
x_test <- read.table("test/X_test.txt")
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_data <- rbind(subject_train, subject_test)

# Step 2 - Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get columns with mean() or std() in their names out of entire feature set
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns from x_data to reduce the columns
x_data <- x_data[, mean_and_std_features]

# correct the column names of x_data
names(x_data) <- features[mean_and_std_features, 2]

# Step 3 - Use descriptive activity names to name the activities in the data set
###############################################################################
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name of y_data
names(y_data) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set - to merge data of all activities for all subjects
all_data <- cbind(x_data, y_data, subject_data)

# Step 5 - Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

# take average of clolumns 1 - 66 group by 67, 68 (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
#write the data to a separate txt file as output - if needed
write.table(averages_data, "averages_data.txt", row.name=FALSE)
