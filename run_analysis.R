## Set working directory
setwd("C:/coursera/Course 3 Getting and Cleaning Data")

## Download and unzip the file
if(!file.exists("./Course 3 Data")){dir.create("./Course 3 Data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Course 3 Data/Dataset.zip")
unzip(zipfile="./Course 3 Data/Dataset.zip",exdir="./Course 3 Data")

## Read the data sets
activity_labels = read.table("./Course 3 Data/UCI HAR Dataset/activity_labels.txt")
features_labels <- read.table("./Course 3 Data/UCI HAR Dataset/features.txt")
subject_test <- read.table("./Course 3 Data/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./Course 3 Data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./Course 3 Data/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./Course 3 Data/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./Course 3 Data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./Course 3 Data/UCI HAR Dataset/train/y_train.txt")

## Merge the training and test sets to create one data set & Labels data set with descriptive variable names
subject <- rbind(subject_test, subject_train)
colnames(subject) <- "subject_id"
features <- rbind(x_test, x_train)
colnames(features) <- features_labels[,2]
activity <- rbind(y_test, y_train)
colnames(activity) <- "activity_id"
data <- cbind(subject, activity, features)

## Extracts only measurements on the mean and standard deviation
meanstd <- names(data)[grep("subject_id|activity_id|mean|std|AccMean|gravityMean",names(data))]
workingdata1 <- data[meanstd]

## Uses descriptive activity names to name the activities in the data set
colnames(activity_labels) <- c("activity_id", "activity")
workingdata2 <- merge(workingdata1, activity_labels, by = "activity_id", all = TRUE)
## Remove column "activity_id"
workingdata3 <- subset(workingdata2, select = -c(activity_id))
## Reorder the column by the sequence of subject, activity and features
newdata <- workingdata3[c(1, 88, 2:87)]
newdata[1,]

## Update variable name
colnames(newdata) <- gsub("BodyBody", "Body", colnames(newdata))
## Independent tidy data set with average of each variable for each activity and subject
library(reshape2)
tidydata <- aggregate(. ~subject_id + activity, newdata, mean)
write.table(tidydata, "Tidy_Data.txt", row.name=FALSE)