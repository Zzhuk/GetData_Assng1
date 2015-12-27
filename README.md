# GetData_Assng1
Course project for "Getting and cleaning data" course @Coursera

1. Download the file and post to your working directory
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Run "run_analysis.R" using ```source("run_analysis.R)``` (check first that your working directory contains zip). This script generates a tidy dataset with the following steps:
      - Merges the training and the test sets to create one data set.
      - Extracts only the measurements on the mean and standard deviation for each measurement. 
      - Uses descriptive activity names to name the activities in the data set
      - Appropriately labels the data set with descriptive variable names. 
      - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

3. After the run you will find "Tidy.txt" file in your working directory. This is an independent tidy data set with the average of each variable for activity and each subject.

Other files:

**CodeBook.md** - contains variables and summaries calculated with this code, along with units, and  other relevant information.
**ReproduceMe.docx** - dynamic document which contains all the steps to reproduce run_analysis.R along with some of the outputs.