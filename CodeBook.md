## Codebook for project_final.txt

This data set contains means by subject and activity for the means and standard deviations of various measures collected by accelerometers
and gyroscopes embedded in Samsun Galaxy S smartphones.  30 subjects were involved in the study, and their measurements were used to identify which of six possible
activities they were doing at the time.  In fact, the purpose of the study was to estimate signal patterns for each activity:  standing, sitting, laying, walking, walking upstairs, or walking downstairs.

### Details of the measurements and their transformations:  

The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz 
to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low 
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


### The tidy data set represents this information as follows:

Every record begins with these three identifier variables:

* subject_number:  Which of subjects 1-30 the record is for
* activity:  The activity description - standing, sitting, etc. - for the current record (corresponds to activity numbers 1-6)
* which_activity:  The activity number (1-6) for the current record

The remaining variables are means of either means or standard deviations of variables as indicated by the variable names described above.
See that information for the meaning when a variable begins with t or f or ends with -X, -Y, or -Z.


* tBodyAcc-X, -Y, -Z

* tGravityAcc-X, -Y, -Z

* tBodyAccJerk-X, -Y, -Z

* tBodyGyro-X, -Y, -Z

* tBodyGyroJerk-X, -Y, -Z

* tBodyAccMag

* tGravityAccMag

* tBodyAccJerkMag

* tBodyGyroMag

* tBodyGyroJerkMag

* fBodyAcc-X, -Y, -Z

* fBodyAccJerk-X, -Y, -Z

* fBodyGyro-X, -Y, -Z

* fBodyAccMag

* fBodyBodyAccJerkMag

* fBodyBodyGyroMag

* fBodyBodyGyroJerkMag


Note that some collected variables that might appear to be means - their names included the tag meanFreq - were excluded from this collection because each represents
a weighted average and haa no corresponding standard deviation.







