# Getting and Cleaning Data Project
### Description
The R script (run_analysis.R) and dataset (UCI_HAR_mean.txt) included in this repo are solutions to the project problem for the Getting and Cleaning Data course.

### R Script Detail
Based on Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository, data collected from accelerometers from Samsung Galaxy S smartphone are read and processed by run_analysis.R script into a tidy data set of mean values that can readily be further analyzed as a function of (i.e. calculation by groups):

* subject identification (subject number)
* activity type (laying, walking, etc.)
* siganl type (time or frequency domain signal)
* sensed (e.g. BodyAcceleration, etc)
* direction (e.g. X, Y, Z directions and Euclidian Magnitude of X, Y, Z, etc.)

### Dataset Detail
The dataset in UCI_HAR_mean.txt has been processed into a tidy dataset and saved by the run_analysis.R script:

* There is one column variable (mean) that actually has measurement values.
* Other variables including subject, activity, domain, sensed are all factor variables.
* The factor variables domain, sensed, and direction have been gathered from the columns of the original data and subsequently separated into meaningful variables, thus resulting in a long (rather than wide) dataset amenable to analyzing.
