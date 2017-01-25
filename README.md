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

### Note
The tidy dataset UCI_Har_mean.txt includes only the mean data (i.e. std values were left out), because it made little sense to average std data.  However, a second version run_analysis_II.R is included that leaves the std data in, so that a further grouping is possible in terms of stat: mean and std.  Also a second tidy dataset, UCI_Har_mean_II.txt corresponding to it are included.
