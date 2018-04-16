# Getting and Cleaning Data
The goal of this project is to create a tidy dataset from both test and train data containing "wearable data".  Once combined into one dataset,
the script will find the average of only those columns that contain **'mean'** and **'standard deviation'** data.

## Defined Requirements

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Test and Train each contain 3 files

x file = measures\
y file = activity id\
subject file  = test subject id of who is being evaluated\

# The Dataset
## Human Activity Recognition Using Smartphones Data Set 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Libraries
dplyr\
reshape2

# Steps within the R Script

1) Download and unzip the data
2) Load activity labels
3) Determine only mean and standard deviation column data
4) Test Data - Load and combine 3 files into 1 for only columns that meet the requirement
5) Train Data -  Load and combine 3 files into 1 for only columns that meet the requirement
6) Combine 2 sets of data into 1 dataset
7) Update activity labels to be descriptive
8) Update columns(variables) to be descriptive
9) Find the average of all non-grouped columns


# Output Dataset
tidydataset.txt

# Authors
Don Seifried


