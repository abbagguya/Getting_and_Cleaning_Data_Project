
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

### Variables

### subject   activity      domain             sensed           direction              mean         
    1: 198   LAYING            :990   Length:5940        Length:5940        Length:5940        Min.   :-0.99762  
    2: 198   SITTING           :990   Class :character   Class :character   Class :character   1st Qu.:-0.93140  
    3: 198   STANDING          :990   Mode  :character   Mode  :character   Mode  :character   Median :-0.12974  
    4: 198   WALKING           :990                                                            Mean   :-0.30898  
    5: 198   WALKING_DOWNSTAIRS:990                                                            3rd Qu.:-0.01192  
    6: 198   WALKING_UPSTAIRS  :990                                                            Max.   : 0.97451 