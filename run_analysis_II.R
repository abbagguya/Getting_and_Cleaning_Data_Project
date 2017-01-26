# Week 4 Project
# James Kim
# 1-25-2017

# working directory is set to that containing the datasets
# read the two datasets and combine into one dataset
# read.table function is used directly in rbind()
# to avoid assigning temporary variables
data <- rbind(read.table("X_train.txt"), read.table("X_test.txt"))
dim(data) # 10299 rows and 561 columns OK

# 1. merge the training and test datasets

# column names stored separately in column 2 of features.txt
# read them and set as column names of data
colnames(data) <- read.table("features.txt")[, 2]
length(names(data)) # 561 column names OK

# 2. extract only the measurements on the mean and standard deviation
# for each measurment

# selectors for columns with mean and std data
# (meanFreq for std data were omitted since no corresponding mean data exist)
is.mean.col <- grepl("mean()", colnames(data), fixed = TRUE)
is.std.col <- grepl("std()", colnames(data), fixed = TRUE)
length(is.mean.col) # 33 columns OK
length(is.std.col) # 33 columns OK

# split the names left and right of "-" and see if matched (TRUE)
all(unlist(lapply(strsplit(colnames(data[, is.mean.col]), "-"),
                  function(x) x[1])) ==
        unlist(lapply(strsplit(colnames(data[, is.std.col]), "-"),
                      function(x) x[1]))) # TRUE OK

# select columns pointed to by is.mean.col and is.std.col
# cbinding was delibrately chosen to keep the mean and std separated for now
stat.data <- cbind(data[, is.mean.col], data[, is.std.col])
dim(stat.data) # 10299 rows and 66 columns OK

# 3. use descriptive activity names to name the activities in the data set
# load activity names
# read.table function is used directly in c()
# to avoid assigning temporary variables
# 1 - 6
activity.code <- c(read.table("y_train.txt")[, 1],
                   read.table("y_test.txt")[, 1])
length(activity.code) # 10299 = number of rows of stat.data OK

# load activity labels
activity.labels <-
    read.table("activity_labels.txt")[, 2]
length(activity.labels) # 6 OK
activity <- activity.labels[activity.code]

# also load subjects although not requested explicitly
subject <- c(read.table("subject_train.txt")[, 1],
             read.table("subject_test.txt")[, 1])
length(subject) # 10299 = number of rows of stat.data OK

# stat.data now contains factors subject, activity and data mean, std
stat.data <- cbind(subject = as.factor(subject),
                   activity = as.factor(activity),
                   stat.data)
dim(stat.data) # 10299 rows and 68 columns OK

# 4. appropriately label the data set with descriptive variable names
# 5. from the data set in step 4 creates a second independent tidy data set
# with the average of each variable for each activity and each subject

# carefully reconstruct the measurement types from the features_info.txt:
# the names are not "tidy" for subsequent tidying operations
# need:
# time_[sensed signal]_[X, Y, Z, Mag]_[mean, std]
# freq_[sensed signal]_[X, Y, Z, Mag]_[mean, std]

# while this can be done programatically
# it would be more efficient and less time consuming using Excel
# save to column_names.txt for processing in Excel
write.table(colnames(stat.data), file = "column_names.txt")
# names have been modified and saved in col_names.txt
# also "BodyBody" has been corrected to "Body" according to features_info.txt
colnames(stat.data) <- read.table("col_names.txt")[, 2]

require(dplyr)

# convert to tbl_df and isolate std data
stat.data <- tbl_df(stat.data)
mean.data <-
    select(stat.data, c(1, 2, grep("std", colnames(stat.data), fixed = TRUE)))

# only mean data here -- remove "_std" (4 characters)
substr(colnames(mean.data), 1, nchar(colnames(mean.data)) - 4)

require(tidyr)

# subject, activity, measurement, mean are variables
gathered.mean.data <- gather(mean.data, measurement, mean_std, -(subject:activity))

# separate into measurement classification
tidy.mean.data <- separate(gathered.mean.data, measurement,
                           c("domain", "sensed", "direction"))

# group by subject, activity, domain, sensed, direction
grouped.tidy.mean.data <-
    group_by(tidy.mean.data, subject, activity, domain, sensed, direction)

# calculate grouped mean values
# a tidy dataset on which filter function can be used to calcuate
# any grouped mean
# decending order for domain so that time domain signal is shown first
mean.summary <- grouped.tidy.mean.data %>%
    summarize(mean_std = mean(mean_std)) %>%
    arrange(subject, activity, desc(domain), sensed, direction)

# output to a file
write.table(mean.summary, "UCI_HAR_mean_II.txt", sep = '\t', row.names = FALSE)
