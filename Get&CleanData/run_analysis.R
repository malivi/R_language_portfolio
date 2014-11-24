library(data.table)

# Reading the training data set
DT_train <- as.data.table(read.table("train/X_train.txt"))
DT_train_y <- fread("train/y_train.txt")
DT_train_sub <- fread("train/subject_train.txt")
DT_train <- DT_train[, Activity := DT_train_y]
DT_train <- DT_train[, Subject := DT_train_sub]
rm(DT_train_y)
rm(DT_train_sub)

# Reading the test data set
DT_test <- as.data.table(read.table("test/X_test.txt"))
DT_test_y <- fread("test/y_test.txt")
DT_test_sub <- fread("test/subject_test.txt")
DT_test <- DT_test[, Activity := DT_test_y]
DT_test <- DT_test[, Subject := DT_test_sub]
rm(DT_test_y)
rm(DT_test_sub)


# Merges the training and the test sets to create one data set.
DT <- rbind(DT_train, DT_test)

# Extract the measurements on the mean and standard deviation while keeping Subject and Activity
var_names <- read.table("features.txt")
index_mean_std <- sort(union(grep("mean", var_names[,2]), grep("std", var_names[,2])))
DT_meanstd <- DT[, c(index_mean_std, 562, 563), with = FALSE]

# Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("activity_labels.txt")
DT_meanstd$Activity <- as.factor(DT_meanstd$Activity)
levels(DT_meanstd$Activity) <- tolower(activity_labels[,2])
DT_meanstd$Activity <- as.character(DT_meanstd$Activity)
rm(activity_labels)

# Appropriately labels the data set with descriptive variable names
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

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
DT_tidy <- aggregate(x = DT_meanstd[,-c(80, 81), with = FALSE], by = list(Activity = DT_meanstd$Activity, Subject = DT_meanstd$Subject), FUN = "mean")

# Extract tidy data to local file
write.table(DT_tidy, file = "tidy_data_activity_subject.txt", row.name = FALSE)
