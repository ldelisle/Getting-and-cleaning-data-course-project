#Homework

#Insure to be in the UCI HAR Dataset repo

#Reading the activity_labels.txt file
activity_labels <- read.table("activity_labels.txt")
head(activity_labels)
  V1                 V2
1  1            WALKING
2  2   WALKING_UPSTAIRS
3  3 WALKING_DOWNSTAIRS
4  4            SITTING
5  5           STANDING
6  6             LAYING

dim(activity_labels)
[1] 6 2


#Reading the features.txt file
features <- read.table("features.txt")
 head(features)
  V1                V2
1  1 tBodyAcc-mean()-X
2  2 tBodyAcc-mean()-Y
3  3 tBodyAcc-mean()-Z
4  4  tBodyAcc-std()-X
5  5  tBodyAcc-std()-Y
6  6  tBodyAcc-std()-Z

dim(features)
[1] 561   2

#We consider the second column of features. We call the column the measurements.

measurements<- features[,2]

#We extract the measurements involving the mean and the standard deviation

MeanStd <- grep("mean|std",measurements,value=T)

head(MeanStd)
[1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"
[4] "tBodyAcc-std()-X"  "tBodyAcc-std()-Y"  "tBodyAcc-std()-Z"

length(MeanStd)
[1] 79

#Reading the X_test.txt, y_test.txt and subject_test.txt files
#Look at their dimensions
xtest <- read.table("./test/X_test.txt")
dim(xtest)
[1] 2947  561

ytest <-read.table("./test/y_test.txt")
dim(ytest)
[1] 2947    1

subjecttest <- read.table("./test/subject_test.txt")
 dim(subjecttest)
[1] 2947    1

#Change the xtest column names with the measurements
names(xtest)<-measurements

#Extract from xtest the measurements involving the mean and the std

xtest <- xtest[,MeanStd]
dim(xtest)
[1] 2947   79

#Let us now create a second column for ytest data frame containing the activity labels
ytest[,2] <-activity_labels[ytest[,1],2]
head(ytest)
  V1       V2
1  5 STANDING
2  5 STANDING
3  5 STANDING
4  5 STANDING
5  5 STANDING
6  5 STANDING
tail(ytest)
     V1               V2
2942  2 WALKING_UPSTAIRS
2943  2 WALKING_UPSTAIRS
2944  2 WALKING_UPSTAIRS
2945  2 WALKING_UPSTAIRS
2946  2 WALKING_UPSTAIRS
2947  2 WALKING_UPSTAIRS

#Let us now change the names of the columns for ytest and subjecttest
names(ytest) <- c("activitynumber","activitynames")
names(subjecttest)<-"volunteersnumber"

#Merging the data for the test repo
mergeDataTest <-cbind(subjecttest,ytest,xtest)
dim(mergeDataTest)
[1] 2947   82

#Now, we do a similar analysis for the train repo

#Reading the X_train.txt, y_test.txt and subject_train.txt files
#Look at their dimensions
xtrain <- read.table("./train/X_train.txt")
dim(xtrain)
[1] 7352  561

ytrain <-read.table("./train/y_train.txt")
dim(ytrain)
[1] 7352    1

subjecttrain <- read.table("./train/subject_train.txt")
 dim(subjecttrain)
[1] 7352    1

#Change the xtrain column names with the measurements
names(xtrain)<-measurements

#Extract from xtrain the measurements involving the mean and the std

xtrain <- xtrain[,MeanStd]
dim(xtrain)
[1] 7352   79

#Let us now create a second column for ytest data frame containing the activity labels
ytrain[,2] <-activity_labels[ytrain[,1],2]

#Let us now change the names of the columns for ytest and subjecttest
names(ytrain) <- c("activitynumber","activitynames")
names(subjecttrain)<-"volunteersnumber"

#Merging the data for the train repo
mergeDataTrain <-cbind(subjecttrain,ytrain,xtrain)
dim(mergeDataTrain)
[1] 7352   82

#The idea is to merge but data frames: mergeDataTest and mergeDataTrain
#We use the rbind function to do this
MergeData <- rbind(mergeDataTest,mergeDataTrain)

#Look at its dimension. It is coherent!
 dim(MergeData)
[1] 10299    82

#We calculate the mean of each columns using the dcast function
#the dcast function is available in the reshape2 package
library(reshape2)
averagedataframe   = dcast(MergeData, volunteersnumber + activitynames ~ "averages", mean)

