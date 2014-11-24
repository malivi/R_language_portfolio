CodeBook for the Course Project of Coursera "Getting and Cleaning Data"
-----

The initial Data Set used for the analysis is from "Human Activity Recognition Using Smart Phones Data Set" (for further information look at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data were cleaned and transformed according to the specifications.

The data resulting from the analysis are arranged in a table with 81 columns and 180 rows. The first two columns correspond to Activity and Subject. The other columns have the information of the average value of the selected features (variables), corresponding to mean and standard deviation, from the initial Data Set for each Activity and each Subject.

There are no missing values.

###Variables of the tidy data:


| Variable| Values | Description |
| ------- |:------:| -----------:|
| **Activity** | laying, sitting, standing, walking, walking_downstairs, walking_upstairs | Activity performed by the volunteer (Subject) |
| **Subject** | number: 1 to 30 | Number ID of the volunteer |
| **tBodyAccMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body acceleration signal in time domain
| **tBodyAccMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body acceleration signal in time domain
| **tBodyAccMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body acceleration signal in time domain
| **tBodyAccStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body acceleration signal in time domain
| **tBodyAccStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body acceleration signal in time domain
| **tBodyAccStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body acceleration signal in time domain
| **tGravityAccMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis gravity acceleration signal in time domain
| **tGravityAccMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis gravity acceleration signal in time domain
| **tGravityAccMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis gravity acceleration signal in time domain
| **tGravityAccStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis gravity acceleration signal in time domain
| **tGravityAccStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis gravity acceleration signal in time domain
| **tGravityAccStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis gravity acceleration signal in time domain
| **tBodyAccJerkMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body acceleration Jerk signal in time domain
| **tBodyAccJerkMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body acceleration Jerk signal in time domain
| **tBodyAccJerkMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body acceleration Jerk signal in time domain
| **tBodyAccJerkStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body acceleration Jerk signal in time domain
| **tBodyAccJerkStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body acceleration Jerk signal in time domain
| **tBodyAccJerkStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body acceleration Jerk signal in time domain
| **tBodyGyroMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroJerkMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroJerkMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroJerkMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroJerkStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroJerkStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroJerkStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyAccMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the body acceleration signal in time domain
| **tBodyAccMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body acceleration signal in time domain
| **tGravityAccMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the gravity acceleration signal in time domain
| **tGravityAccMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the agnitude of gravity acceleration signal in time domain
| **tBodyAccJerkMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the body acceleration Jerk signal in time domain
| **tBodyAccJerkMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body acceleration Jerk signal in time domain
| **tBodyGyroMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of the body angular velocity (gyroscope measurement) signal in time domain
| **tBodyGyroJerkMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the body angular velocity (gyroscope measurement) Jerk signal in time domain
| **tBodyGyroMagJerkStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of the body angular velocity (gyroscope measurement) Jerk signal in time domain
| **fBodyAccMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body acceleration signal in frequency domain
| **fBodyAccMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body acceleration signal in frequency domain
| **fBodyAccMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body acceleration signal in frequency domain
| **fBodyAccStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body acceleration signal in frequency domain
| **fBodyAccStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body acceleration signal in frequency domain
| **fBodyAccStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body acceleration signal in time domain
| **fBodyAccMeanFreqX** | normalized and bounded within [-1,1] | Mean frequency of the X-axis body acceleration signal in frequency domain
| **fBodyAccMeanFreqY** | normalized and bounded within [-1,1] | Mean frequency of the Y-axis body acceleration signal in frequency domain
| **fBodyAccMeanFreqZ** | normalized and bounded within [-1,1] | Mean frequency of the Z-axis body acceleration signal in frequency domain
| **fBodyAccJerkMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMeanFreqX** | normalized and bounded within [-1,1] | Mean frequency of the X-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMeanFreqY** | normalized and bounded within [-1,1] | Mean frequency of the Y-axis body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMeanFreqZ** | normalized and bounded within [-1,1] | Mean frequency of the Z-axis body acceleration Jerk signal in frequency domain
| **fBodyGyroMeanX** | normalized and bounded within [-1,1] | Mean of the X-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMeanY** | normalized and bounded within [-1,1] | Mean of the Y-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMeanZ** | normalized and bounded within [-1,1] | Mean of the Z-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroStdevX** | normalized and bounded within [-1,1] | Standard deviation of the X-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroStdevY** | normalized and bounded within [-1,1] | Standard deviation of the Y-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroStdevZ** | normalized and bounded within [-1,1] | Standard deviation of the Z-axis body angular velocity (gyroscope measurement) signal in time domain
| **fBodyGyroMeanFreqX** | normalized and bounded within [-1,1] | Mean frequency of the X-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMeanFreqY** | normalized and bounded within [-1,1] | Mean frequency of the Y-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMeanFreqZ** | normalized and bounded within [-1,1] | Mean frequency of the Z-axis body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyAccMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of the body acceleration signal in frequency domain
| **fBodyAccMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body acceleration frequency in time domain
| **fBodyAccMagMeanFreq** | normalized and bounded within [-1,1] | Mean frequency of the magnitude of body acceleration signal in frequency domain
| **fBodyAccJerkMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body acceleration Jerk signal in frequency domain
| **fBodyAccJerkMagMeanFreq** | normalized and bounded within [-1,1] | Mean frequency of the magnitude of body acceleration Jerk signal in frequency domain
| **fBodyGyroMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMagMeanFreq** | normalized and bounded within [-1,1] | Mean frequency of the magnitude of body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroMagMeanFreq** | normalized and bounded within [-1,1] | Mean frequency of the magnitude of body angular velocity (gyroscope measurement) signal in frequency domain
| **fBodyGyroJerkMagMean** | normalized and bounded within [-1,1] | Mean of the magnitude of body angular velocity (gyroscope measurement) Jerk signal in frequency domain
| **fBodyGyroJerkMagStdev** | normalized and bounded within [-1,1] | Standard deviation of the magnitude of body angular velocity (gyroscope measurement) Jerk signal in frequency domain
| **fBodyGyroJerkMagMeanFreq** | normalized and bounded within [-1,1] | Mean frequency of the magnitude of body angular velocity (gyroscope measurement Jerk signal in frequency domain
