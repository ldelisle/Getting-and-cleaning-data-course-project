### Getting and Cleaning Data Course project

The goal of this project is to create a tidy data set that can be further use for analysis.
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. We have to
create a R script called **run_analysis.R** that does the following:

* Merges the train and the test sets to create one data set
* Extract only the measurements on the mean and the standard deviation for each measurements
* Use descriptive activity names to name the activities in the data set
* Appropriately label the data set with descriptive variable names
* From the previous data set, create a second, independent tidy data set with the average of each variable for each activity and each subject

## Merging the train and the test sets to create one data set

I start this requirement by the test set. Using the read.table function, I read the 
X_test.txt, the y_test.txt and the subject_test.txt files. Similarly as the test set, I
use read.table to read the X_train.txt, the y_train.txt and the subject_train.txt files.

Before merging the test and train sets, I merge the data of test set together using the
cbind function and do the same for the train set.

Using the rbind function, I merge the train and test sets together to create one data set.

## Extracting the measurements on the mean and the standard deviation for each measurements

The first step is to extract the second column of the feature.txt file, which correspond
to all the measurements.

To extract the measurements on the mean and the standard deviation (std), I use the grep 
function in order to identify all the measurements containing the words mean and std.

## Using descriptive activity names to name the activities in the data set.

This is done using the grep function which we had value=T to collect the names of all the
measurements and not only their placements. Using the measurements and the function names ,
I give for each variable descriptives names.

## Creating the second tidy data set

This last step is accomplished using the dcast function of the reshape2 package. We split
according to the volunteersnumber and activityname and apply the mean function.

##Summary

MergeData correspond to the tidy data set build from the train and test sets. The 
averagedataframe correspond to the second tidy data set evaluating the averages of each 
variable for each activity and subject. 