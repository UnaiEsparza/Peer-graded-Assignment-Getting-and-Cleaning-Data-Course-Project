# Code Book for Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project

This is the Code Book to explain the transformations done with the R script called "run_analysis.R".

Firstly, the Samsung Wearable zip file was downloaded and unzipped.

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
