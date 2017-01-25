
# Getting and Cleaning Data Project
### Description
The R script (run_analysis.R) and dataset (UCI_HAR_mean.txt) included in this repo are solutions to the project problem for the Getting and Cleaning Data course.

### R Script Detail
Based on Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository, data collected from accelerometers from Samsung Galaxy S smartphone are read and processed by run_analysis.R script into a tidy data set of mean values that can readily be further analyzed as a function of (i.e. calculation by groups):

* subject identification (subject number)
* activity type (laying, walking, etc.)
* siganl type (time or frequency domain signal)
* sensed (e.g. BodyAcceleration, etc)
* direction (e.g. X, Y, Z directions and Euclidian Magnitude of the X, Y, Z, directions etc.)

### Dataset Detail
The dataset in UCI_HAR_mean.txt has been processed into a tidy dataset and saved by the run_analysis.R script:

* There is one column variable (mean) that actually has measurement values.
* Other variables including subject, activity, domain, sensed should be read in as factor variables.
* The factor variables domain, sensed, and direction have been gathered from the columns of the original data and subsequently separated into meaningful variables, thus resulting in a long (rather than wide) dataset amenable to analyzing.

### Variables Detail

UCI_HAR_mean variables:

* subject(1...30)
* activity(6 activities)
* domain(time, freq)
* sensed(see below)
* direction(see below)
* mean(number)

domain, sensed, direction variables have been built from the following variables in the UCI Har dataset (the variable names have been modified silghty for facilitated use in gather and separate functions in the tidyr package):

* subject
* activity
* time_BodyAcc_X_mean
* time_BodyAcc_Y_mean
* time_BodyAcc_Z_mean
* time_GravityAcc_X_mean
* time_GravityAcc_Y_mean
* time_GravityAcc_Z_mean
* time_BodyAccJerk_X_mean
* time_BodyAccJerk_Y_mean
* time_BodyAccJerk_Z_mean
* time_BodyGyro_X_mean
* time_BodyGyro_Y_mean
* time_BodyGyro_Z_mean
* time_BodyGyroJerk_X_mean
* time_BodyGyroJerk_Y_mean
* time_BodyGyroJerk_Z_mean
* time_BodyAcc_Mag_mean
* time_GravityAcc_Mag_mean
* time_BodyAccJerk_Mag_mean
* time_BodyGyro_Mag_mean
* time_BodyGyroJerk_Mag_mean
* freq_BodyAcc_X_mean
* freq_BodyAcc_Y_mean
* freq_BodyAcc_Z_mean
* freq_BodyAccJerk_Y_mean
* freq_BodyAccJerk_Z_mean
* freq_BodyGyro_X_mean
* freq_BodyGyro_Y_mean
* freq_BodyGyro_Z_mean
* freq_BodyAcc_Mag_mean
* freq_BodyAccJerk_Mag_mean
* freq_BodyGyro_Mag_mean
* freq_BodyGyroJerk_Mag_mean

### Key Processing Methods
* starting from mean.data which is a tbl_df with data in the original format with original column variables
* -> gather(mean.data, measurement, mean, -(subject:activity))
* -> separate(gathered.mean.data, measurement, c("domain", "sensed", "direction"))
* -> group_by(tidy.mean.data, subject, activity, domain, sensed, direction)
* -> grouped.tidy.mean.data %>%
     summarize(mean = mean(mean)) %>%
     arrange(subject, activity, desc(domain), sensed, direction)
* -> result in mean.summary
