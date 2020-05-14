#This is the code book for the project

##How to get to the tinyData.txt:

Download data from the link below and unzip it into working directory of R Studio.
Execute the R script.
About the source data
The source data are from the Human Activity Recognition Using Smartphones Data Set. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script
File with R code "run_analysis.R" performs the 5 following steps (in accordance assigned task of course work):
<ul>

<li><b>Reading in the files and merging the training and the test sets to create one data set.</b></li>
<ul>
 <li>Reading trainings tables</li>
 <li>Reading testing tables</li>
 <li>Reading feature vector</li>
 <li>Reading activity labels</li>
 <li>Assigning variable names</li>
<li>Merging all data in one set</li>
</ul>
<li><b>Extracting only the measurements on the mean and standard deviation for each measurement</b></li>
<ul>
<li>Reading variable names</li>
<li>Create vector for defining ID, mean and standard deviation</li>
<li>Making nessesary subset from merged data set</li>
</ul>
<li><b>Using descriptive activity names to name the activities in the data set</b></li>
<li><b>Appropriately labeling the data set with descriptive variable names</b></li>
<li><b>Creating a second, independent tidy data set with the average of each variable for each activity and each subject</b></li>
</ul>
<ul>
<li>Making second tidy data set</li>
<li>Writing second tidy data set in txt file</li>

The code assumes all the data is present in the same folder, un-compressed and without names altered.

<b>About variables:</b><br>
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in
