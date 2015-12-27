## Considering zip file was downloaded to working directory

##Loading data
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
    ## test data:
    XTest<- read.table("UCI HAR Dataset/test/X_test.txt")
    YTest<- read.table("UCI HAR Dataset/test/Y_test.txt")
    SubjectTest <-read.table("UCI HAR Dataset/test/subject_test.txt")
    
    ## train data:
    XTrain<- read.table("UCI HAR Dataset/train/X_train.txt")
    YTrain<- read.table("UCI HAR Dataset/train/Y_train.txt")
    SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")
    
    ## features and activity
    features<-read.table("UCI HAR Dataset/features.txt")
    activity<-read.table("UCI HAR Dataset/activity_labels.txt")

##Part 1 - merges train and test data in one dataset (full dataset at the end)
    X<-rbind(XTest, XTrain)
    Y<-rbind(YTest, YTrain)
    Subject<-rbind(SubjectTest, SubjectTrain)

##Part 2 - getting indeces for mean and stdev variables 
    index<-grep("mean\\(\\)|std\\(\\)", features[,2])
    length(index) ##66 variables found
    
    X<-X[,index] ## getting only variables iwth mean/stdev
    dim(X) ## 10299 and 66

##Part 3 - updating activity lables
    Y[,1]<-activity[Y[,1],2] ## won't reorder Y set

##Part 4 and Part 1 - updating labels and creating full dataset with labels and names     
    names<-features[index,2] ## getting names for variables
    
    names(X)<-names ## updating colNames for new dataset
    names(Subject)<-"SubjectID"
    names(Y)<-"Activity"
    
    CleanedData<-cbind(Subject, Y, X)

##Part 5 - creating tidy data set 
    library(data.table) ## for aggregations and output
    
    CleanedData<-data.table(CleanedData)
    TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity']
    write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
    
    



