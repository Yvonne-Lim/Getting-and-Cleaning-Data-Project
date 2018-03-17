# Getting-and-Cleaning-Data-Project
### Introduction
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. As such, this project will be required to create a R script called run_analysis.R. You will be required to submit: 
1) a tidy data set created by run_analysis.R
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

Packages to be installed: install.packages("reshape2")

### The instruction list for the R script called run_analysis.R: 
1. The first part of the R script will be downloading the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip the data ("UCI HAR Dataset" will be created) into the selected working directory.  
2. Reads all the data sets from "UCI HAR Dataset": activity labels, features, subject (for test and train), test and training data. 
3. Merges the training, test and subject data to create one data set by using rbind and cbind and name it as "data". Label the column name by "subject_id", "activity_id" and also the descriptive vsariable names taken from the features.txt file.
4. Extracts only the measurements on the mean and standard deviation for each measurement by the grep function. 
5. Gets the descriptive activity names of the data set by looking up the activity_id from the activity_labels.txt file.
6. Fixing characters in the data by the gsub function.  
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject by using the reshape2 package and name it as Tidy_Data.txt file with write.table() using row.name=FALSE.
