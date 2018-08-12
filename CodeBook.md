R script called run_analysis.R does the following - 

Step 1 - Merges the training and the test sets to create one data set.
  - x_test, x_train, y_test, y_train, subject_test, subject_train - are all the test and data files which are imported into these data tables
  - using rbind - test and train data is merged into x_data, y_data, subject_data


Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
   - Extracts the relevant columns from features.txt and uses that to select a subset of columns from x_data; 
   - also gives the columns the relevant column names


Step 3 - Uses descriptive activity names to name the activities in the data set
  - updates y_data with the matching activity names from activities.txt; 
  - also updates the column title as 'activity'


Step 4 - Appropriately labels the data set with descriptive variable names.
  - Labels the Subject_data dataset with the right lable
  - colbind x_data with the activity and subject (y_data, subject_data) to merge all the data into a small table  


Step 5 - From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.
  - This is stored in averages_data.txt
