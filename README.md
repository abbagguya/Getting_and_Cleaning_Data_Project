# Getting and Cleaning Data Project
### Description
The R script (run_analysis.R) and dataset (UCI_HAR_mean.txt) included in this repo are solutions to the project problem for the Getting and Cleaning Data course.

### R Script Detail
Based on Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository, data collected from accelerometers from Samsung Galaxy S smartphone are read and processed by run_analysis.R script into a tidy data set of mean values that can readily be further analyzed as a function of (i.e. calculation by groups):

* subject identification (subject number)
* activity type (laying, walking, etc.)
* signal type (time or frequency domain signal)
* sensed (e.g. BodyAcceleration, etc)
* direction (e.g. X, Y, Z directions and Euclidian Magnitude of the X, Y, Z, directions etc.)

### Dataset Detail
The dataset in UCI_HAR_mean.txt has been processed into a tidy dataset and saved by the run_analysis.R script:

* There is one column variable (mean) that actually has measurement values.
* Other variables including subject, activity, domain, sensed should be read in as factor variables.
* The factor variables domain, sensed, and direction have been gathered from the columns of the original data and subsequently separated into meaningful variables, thus resulting in a long (rather than wide) dataset amenable to analyzing.

### *** Note ***
The tidy dataset UCI_Har_mean.txt includes only the mean data (i.e. std values were left out), because the std data is a different kind of data than the mean, i.e. std belongs in another dataset with the same parameter variables as those of the mean.  A second version run_analysis_II.R is included that processes the std data.  A second tidy dataset, UCI_Har_mean_II.txt processed by run_analysis_II.R is also included.
