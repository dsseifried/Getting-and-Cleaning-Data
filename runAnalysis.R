
# Load packages and Libraries

#used to create codebook
install.packages('dataMaid', dependencies = TRUE)
library(dataMaid)   --#makeCodebook(dataset)

#used to reshape data
install.packages('dplyr', dependencies = TRUE)
library(dplyr)
library(reshape2)

# Download and unzip data
if (!file.exists('FUCI HAR Dataset.zip')) {
  filetodownload <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
  download.file(filetodownload,destfile = 'FUCI HAR Dataset.zip')
}
unzip('FUCI HAR Dataset.zip',exdir = './Class3Week4')

#x=measures
#y=activitys
#sub=subject or test subject

# set activity labels and change 2nd col from factor to characters
actlabels<-read.table('./Class3Week4/UCI HAR Dataset/activity_labels.txt')
actlabels[,2] <- as.character(actlabels[,2])

#set feature dataset and change 2nd column from factory to characters
tempfeat <-read.table('./Class3Week4/UCI HAR Dataset/features.txt')
tempfeat[,2]<-as.character(tempfeat[,2])
reqfeatures <- subset(tempfeat, grepl(".*mean.*|.*std.*", tempfeat$V2))

#Load Train hint use cbind
xtrain <- read.table('./Class3Week4/UCI HAR Dataset/train/x_train.txt')[reqfeatures$V1]
ytrain <- read.table('./Class3Week4/UCI HAR Dataset/train/y_train.txt')
subtrain <- read.table('./Class3Week4/UCI HAR Dataset/train/subject_train.txt')
newtrain<-cbind(subtrain,ytrain,xtrain)

#Load Test hint use cbind
xtest <- read.table('./Class3Week4/UCI HAR Dataset/test/x_test.txt')[reqfeatures$V1]
ytest <- read.table('./Class3Week4/UCI HAR Dataset/test/y_test.txt')
subtest <- read.table('./Class3Week4/UCI HAR Dataset/test/subject_test.txt')
newtest<-cbind(subtest,ytest,xtest)

#Merge Test and Train , hints use rbind 

To Do

Change ColNames in combined datasets
Sub activityvalues in column to
Merge test and train


