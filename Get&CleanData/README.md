Getting and Cleaning Data
=======================

1. Repository files
-----
The R script file [run_analysis.R](https://github.com/malivi/getcleandata-course-project/blob/master/run_analysis.R), included in this repository, perfoms the analysis described in the Course Project of Coursera "Getting and Cleaning Data". The final output of the script is a txt file with the tidy data named [tidy_data_activity_subject.txt] (https://github.com/malivi/getcleandata-course-project/blob/master/tidy_data_activity_subject.txt). More information about the variables can be found in the [codebook](https://github.com/malivi/getcleandata-course-project/blob/master/CodeBook.md).

2. Initial Data Set
-----

###2.1 Data Set Information

The initial data set is collected from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The purpose of the data is the Human Activity Recognition Using Smartphones Data Set. Some details of the initial data set are presented here for reasons of completeness.

The experiments have been carried out with a group of 30 volunteers (Subjects) within an age bracket of 19-48 years. Each person performed six Activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity are captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###2.2 Attribute Information

For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


3. Analysis
-----

###3.1 Merge the training and the test sets to create one data set

As described in the initial Data Set Information the captured data have been partitioned randomly in two data sets (train and test). This partitioning is not necessarily for our goal and, in order to expand the data set, we need to combine these sets and process them as one.

The first step is to read separately the two data files. Information about the Subjects and the Activities variables (see initial Data Set Information) are in different txt files and must be inserted as new columns before the final merge of the two data sets.

Reading the training data set:

    DT_train <- as.data.table(read.table("train/X_train.txt"))
    DT_train_y <- fread("train/y_train.txt")
    DT_train_sub <- fread("train/subject_train.txt")
    DT_train <- DT_train[, Activity := DT_train_y]
    DT_train <- DT_train[, Subject := DT_train_sub]
    rm(DT_train_y)
    rm(DT_train_sub)

Reading the test data set:

    DT_test <- as.data.table(read.table("test/X_test.txt"))
    DT_test_y <- fread("test/y_test.txt")
    DT_test_sub <- fread("test/subject_test.txt")
    DT_test <- DT_test[, Activity := DT_test_y]
    DT_test <- DT_test[, Subject := DT_test_sub]
    rm(DT_test_y)
    rm(DT_test_sub)
    
Merge the training and the test sets to create one data set:

    DT <- rbind(DT_train, DT_test)

###3.2 Extract the measurements on the mean and standard deviation of each measurement

As mentioned in the initial Attribute Information a plethora of variables (features) are measured in the time and frequency domain. For the purpose of the project only the means and standard deviations of the various measurements are needed. We extract these by reading the features txt file and selecting only the feature names including the substrings "mean" or "std". The final result is a data frame with the desired features and the columns Subject and Activity.

Extract the measurements on the mean and standard deviation while keeping Subject and Activity:

    var_names <- read.table("features.txt")
    index_mean_std <- sort(union(grep("mean", var_names[,2]), grep("std", var_names[,2])))
    DT_meanstd <- DT[, c(index_mean_std, 562, 563), with = FALSE]

###3.3 Use descriptive activity names to name the activities in the data set

The Activity information in the data is expressed with integer values from 1 to 6. In order to be more descriptive the numbers are replaced with the appropriate description extracted from the activity labes included in the initial data (see initial Data Set Information).

    activity_labels <- read.table("activity_labels.txt")
    DT_meanstd$Activity <- as.factor(DT_meanstd$Activity)
    levels(DT_meanstd$Activity) <- tolower(activity_labels[,2])
    DT_meanstd$Activity <- as.character(DT_meanstd$Activity)
    rm(activity_labels)
    
###3.4 Appropriately label the data set with descriptive variable names

The variable names extracted from the features names, as defined in the initial Data Set, have many special characters (parentheses, dash, etc) that need to be cleaned for the variable names to be more descriptive . In addition some duplicate words in the names have been removed. Further information about the variables can be found in the [codebook](https://github.com/malivi/getcleandata-course-project/blob/master/CodeBook.md).

    var_names_meanstd <- as.character(var_names[index_mean_std, 2])
    var_names_meanstd <- gsub("\\(\\)", "", var_names_meanstd)
    var_names_meanstd <- gsub("mean", "Mean", var_names_meanstd)
    var_names_meanstd <- gsub("std", "Stdev", var_names_meanstd)
    var_names_meanstd <- gsub("-", "", var_names_meanstd)
    var_names_meanstd <- gsub("BodyBody", "Body", var_names_meanstd)
    setnames(DT_meanstd, names(DT_meanstd), c(var_names_meanstd, "Activity", "Subject"))
    rm(var_names_meanstd)
    rm(var_names)
    rm(index_mean_std)
    
###3.5 Create a second, independent tidy data set with the average of each variable for each activity and each subject

The Activity and Subject can have 6 and 30 different values respectively. As a result there are 180 different combinations that the average must be calculated for each of the extracted features (mean or standard deviation). This is performed with the command bellow which perform statistical summaries for data subsets:

    DT_tidy <- aggregate(x = DT_meanstd[,-c(80, 81), with = FALSE], by = list(Activity = DT_meanstd$Activity, Subject =     DT_meanstd$Subject), FUN = "mean")


Finally the desired tidy data set is extracted in a txt file:

    write.table(DT_tidy, file = "tidy_data_activity_subject.txt", row.name = FALSE)
    
