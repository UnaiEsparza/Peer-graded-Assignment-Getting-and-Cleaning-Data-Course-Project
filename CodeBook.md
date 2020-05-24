# Code Book for Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

This is the Code Book to explain the transformations done with the R script called "run_analysis.R".

Firstly, the Samsung Wearable zip file was downloaded and unzipped.

# Background information

This is the background information contained in the README document from the original ZIP file explaining the origin of the data:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

# 1) Merge the training and the test files to create one dataset

Then a new dataset was created by merging the training and testing data files. More precisely, the following recordings were used:
subject_train, X_train, y_train, subject_test, X_test, y_test, activity_labels, features.

In order to be able to merge these files properly, the following column names were created:

The columns from X_train and X_test were named based on the variable names given in the second column of features.

The column from y_train and y_test was named as "activityNumber".

The column from subject_train and subject_test was named as "subjectNumber".

The columns from activity_labels wer named as "activityNumber" and "activity".

# 2) Extract only columns with mean and standard deviation measurements

After that, the columns containing "mean" and "std" (for standard deviation) were extracted to created a new dataset based on them.

# 3) Give descriptive names to activities

Then, the "activities" fields from the dataset were re-named by adding the descriptive activity name given in activity_labels.

# 4) Give descriptive names to variables

After this, descriptive names were given to all variables by replacing shorted words with complete words. The transformation list is:

"Acc" was replaced with "Accelerometer"

"Gyro" was replaced with "Gyroscope"

"t" from the beginning of the variable name was replaced with "Time"

"Freq" was replaced with "Frequency"

"f" from the beginning of the va riable name was replaced with "Frequency"

"Mag" was replaced with "Magnitude"

"std" was replaced with "StandardDeviation"

"BodyBody" was replaced with "Body"

# 5) Get the average of all variables per subject and activity

Finally, the average of all variables per subject and activity was calculated.

The resulting data was stored in a new dataset called AverageOfAllVariables.txt

The complete list of variables obtained in the final dataset is given below:

 [1] "subjectNumber"                                              
 [2] "activity"                                                   
 [3] "activityNumber"                                             
 [4] "TimeBodyAccelerometer-mean()-X"                             
 [5] "TimeBodyAccelerometer-mean()-Y"                             
 [6] "TimeBodyAccelerometer-mean()-Z"                             
 [7] "TimeGravityAccelerometer-mean()-X"                          
 [8] "TimeGravityAccelerometer-mean()-Y"                          
 [9] "TimeGravityAccelerometer-mean()-Z"                          
[10] "TimeBodyAccelerometerJerk-mean()-X"                         
[11] "TimeBodyAccelerometerJerk-mean()-Y"                         
[12] "TimeBodyAccelerometerJerk-mean()-Z"                         
[13] "TimeBodyGyroscope-mean()-X"                                 
[14] "TimeBodyGyroscope-mean()-Y"                                 
[15] "TimeBodyGyroscope-mean()-Z"                                 
[16] "TimeBodyGyroscopeJerk-mean()-X"                             
[17] "TimeBodyGyroscopeJerk-mean()-Y"                             
[18] "TimeBodyGyroscopeJerk-mean()-Z"                             
[19] "TimeBodyAccelerometerMagnitude-mean()"                      
[20] "TimeGravityAccelerometerMagnitude-mean()"                   
[21] "TimeBodyAccelerometerJerkMagnitude-mean()"                  
[22] "TimeBodyGyroscopeMagnitude-mean()"                          
[23] "TimeBodyGyroscopeJerkMagnitude-mean()"                      
[24] "FrequencyBodyAccelerometer-mean()-X"                        
[25] "FrequencyBodyAccelerometer-mean()-Y"                        
[26] "FrequencyBodyAccelerometer-mean()-Z"                        
[27] "FrequencyBodyAccelerometer-meanFrequency()-X"               
[28] "FrequencyBodyAccelerometer-meanFrequency()-Y"               
[29] "FrequencyBodyAccelerometer-meanFrequency()-Z"               
[30] "FrequencyBodyAccelerometerJerk-mean()-X"                    
[31] "FrequencyBodyAccelerometerJerk-mean()-Y"                    
[32] "FrequencyBodyAccelerometerJerk-mean()-Z"                    
[33] "FrequencyBodyAccelerometerJerk-meanFrequency()-X"           
[34] "FrequencyBodyAccelerometerJerk-meanFrequency()-Y"           
[35] "FrequencyBodyAccelerometerJerk-meanFrequency()-Z"           
[36] "FrequencyBodyGyroscope-mean()-X"                            
[37] "FrequencyBodyGyroscope-mean()-Y"                            
[38] "FrequencyBodyGyroscope-mean()-Z"                            
[39] "FrequencyBodyGyroscope-meanFrequency()-X"                   
[40] "FrequencyBodyGyroscope-meanFrequency()-Y"                   
[41] "FrequencyBodyGyroscope-meanFrequency()-Z"                   
[42] "FrequencyBodyAccelerometerMagnitude-mean()"                 
[43] "FrequencyBodyAccelerometerMagnitude-meanFrequency()"        
[44] "FrequencyBodyAccelerometerJerkMagnitude-mean()"             
[45] "FrequencyBodyAccelerometerJerkMagnitude-meanFrequency()"    
[46] "FrequencyBodyGyroscopeMagnitude-mean()"                     
[47] "FrequencyBodyGyroscopeMagnitude-meanFrequency()"            
[48] "FrequencyBodyGyroscopeJerkMagnitude-mean()"                 
[49] "FrequencyBodyGyroscopeJerkMagnitude-meanFrequency()"        
[50] "TimeBodyAccelerometer-StandardDeviation()-X"                
[51] "TimeBodyAccelerometer-StandardDeviation()-Y"                
[52] "TimeBodyAccelerometer-StandardDeviation()-Z"                
[53] "TimeGravityAccelerometer-StandardDeviation()-X"             
[54] "TimeGravityAccelerometer-StandardDeviation()-Y"             
[55] "TimeGravityAccelerometer-StandardDeviation()-Z"             
[56] "TimeBodyAccelerometerJerk-StandardDeviation()-X"            
[57] "TimeBodyAccelerometerJerk-StandardDeviation()-Y"            
[58] "TimeBodyAccelerometerJerk-StandardDeviation()-Z"            
[59] "TimeBodyGyroscope-StandardDeviation()-X"                    
[60] "TimeBodyGyroscope-StandardDeviation()-Y"                    
[61] "TimeBodyGyroscope-StandardDeviation()-Z"                    
[62] "TimeBodyGyroscopeJerk-StandardDeviation()-X"                
[63] "TimeBodyGyroscopeJerk-StandardDeviation()-Y"                
[64] "TimeBodyGyroscopeJerk-StandardDeviation()-Z"                
[65] "TimeBodyAccelerometerMagnitude-StandardDeviation()"         
[66] "TimeGravityAccelerometerMagnitude-StandardDeviation()"      
[67] "TimeBodyAccelerometerJerkMagnitude-StandardDeviation()"     
[68] "TimeBodyGyroscopeMagnitude-StandardDeviation()"             
[69] "TimeBodyGyroscopeJerkMagnitude-StandardDeviation()"         
[70] "FrequencyBodyAccelerometer-StandardDeviation()-X"           
[71] "FrequencyBodyAccelerometer-StandardDeviation()-Y"           
[72] "FrequencyBodyAccelerometer-StandardDeviation()-Z"           
[73] "FrequencyBodyAccelerometerJerk-StandardDeviation()-X"       
[74] "FrequencyBodyAccelerometerJerk-StandardDeviation()-Y"       
[75] "FrequencyBodyAccelerometerJerk-StandardDeviation()-Z"       
[76] "FrequencyBodyGyroscope-StandardDeviation()-X"               
[77] "FrequencyBodyGyroscope-StandardDeviation()-Y"               
[78] "FrequencyBodyGyroscope-StandardDeviation()-Z"               
[79] "FrequencyBodyAccelerometerMagnitude-StandardDeviation()"    
[80] "FrequencyBodyAccelerometerJerkMagnitude-StandardDeviation()"
[81] "FrequencyBodyGyroscopeMagnitude-StandardDeviation()"        
[82] "FrequencyBodyGyroscopeJerkMagnitude-StandardDeviation()" 
