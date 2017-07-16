### Code Book

This is the Code Book for the Getting and Cleaning Data Course project. This code book
contains information on the variables, the data, and the transformations and work I've
done to clean up the  UCI HAR Dataset into a tidy data set.

##The variables

The first column of the data set corresponds to the volunteers identification number. I've
called this variable volunteersnumbers. The next two variables names comes from activity_mlabels.txt
files. There are 6 labels and each labels (activityname) correspond to a number (activitynumber):

* 1 walking
* 2 walking_upstairs
* 3 walking_downstairs
* 4 sitting
* 5 standing
* laying

The next variable names are extracted from the features.txt file. Using the grep function,
I've extracted all the measurements involving the mean or the standard deviation (std).

In the second tidy data set, I've created a new variable "averages" from the dcast and mean functions.
This "averages" variable calculate the average of each variable for each activity and each volunteers.

##The data

We started with the UCI HAR Dataset which contained the test and train sets, the features.txt and 
features_info.txt files, the activity_labels.txt file and a README.txt file. 

The features.txt file contained all the measurements from which we extracted the measurements
containing the mean and the std.

The activity_labels.txt file describles the 6 above labels and was used to create a second column
in the y_test and y_train data sets.

The test and train sets contained respectively the X_test.txt, y_test.txt, subject_test.txt and
X_train, y_train, subject_train files. These files where merged together using the cbind
and rbind functions.

The X_train and X_test files contained the measurements of all the features for the different
volunteers and activity labels. The y_train and y_test contained the information abourt the 
activity of the volunteers. The subject_test and subject_train are the data sets containing
the volunteers identification number

##Transformation on the data sets

The first step was to subset the X_test and X_train data sets in order to keep the measurements
for the features containing the mean and the standard deviation. This was done using the grep function
and the attribute value=T. This attribute also permitted to change the variable labels to 
a more descriptive label in the final dataset.

The cbind funtion was then used to merge X_test, y_test and subject_test files together. We did
the same for the X_train, y_train and subject train files. The merging of the data sets
was accomplish using the rbind function.

The second tidy data set was created using the dcast function from the reshape2 package. Using a split
according to the volunteersnumber and activity label we've created a new variable "averages" using the mean
function.