# Load packages and Libraries

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

#for my sanity to understand each file

#x=measures
#y=activity id
#subject=test subjectid of who is being evaluated

# set activity labels and change 2nd col from factor to characters
actlabels<-read.table('./Class3Week4/UCI HAR Dataset/activity_labels.txt')
actlabels[,2] <- as.character(actlabels[,2])

#set feature dataset and change 2nd column from factory to characters
tempfeat <-read.table('./Class3Week4/UCI HAR Dataset/features.txt')
tempfeat[,2]<-as.character(tempfeat[,2])

#select any columns with the term 'mean' or 'std' in the name STEP 2
reqfeatures <- subset(tempfeat, grepl(".*mean.*|.*std.*", tempfeat$V2))

#Load (Train) - hint forum (thoughtfulbloke)- use cbind  
xtrain <- read.table('./Class3Week4/UCI HAR Dataset/train/x_train.txt')[reqfeatures$V1]
ytrain <- read.table('./Class3Week4/UCI HAR Dataset/train/y_train.txt')
subtrain <- read.table('./Class3Week4/UCI HAR Dataset/train/subject_train.txt')
newtrain<-cbind(subtrain,ytrain,xtrain)

#Load (Test) - hint forum (thoughtfulbloke)- use cbind 
xtest <- read.table('./Class3Week4/UCI HAR Dataset/test/x_test.txt')[reqfeatures$V1]
ytest <- read.table('./Class3Week4/UCI HAR Dataset/test/y_test.txt')
subtest <- read.table('./Class3Week4/UCI HAR Dataset/test/subject_test.txt')
newtest<-cbind(subtest,ytest,xtest)

#Merge Test and Train , hints use rbind STEP 1
fulldata <- rbind(newtrain,newtest)

#update activities to be descriptive in full dataset STEP 3
fulldata$Activity <- actlabels$V2[match(fulldata$Activity, actlabels$V1)]

#Change/Simplify Column Names (fulldata) STEP 4
colnames(fulldata)<-c("Subject","Activity",reqfeatures$V2)
colnames(fulldata)<-gsub("-mean", "Mean", colnames(fulldata))
colnames(fulldata)<-gsub("-std", "Std", colnames(fulldata))
colnames(fulldata)<-gsub("()-", "", colnames(fulldata))
colnames(fulldata)<-gsub("[()]", "", colnames(fulldata))

#STEP 5
tidydataset <- 
      fulldata %>%
      group_by(Activity,Subject) %>%
      summarize_all(funs(mean))

#Write the dataset to a file.
write.table(tidydataset,file = './Class3Week4/tidydataset.txt',row.names = FALSE)

