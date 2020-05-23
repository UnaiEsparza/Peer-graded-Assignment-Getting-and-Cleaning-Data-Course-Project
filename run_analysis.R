
################     GETTING AND CLEANING DATA: Peer-graded Assignment     ################



############        Preparation: download the zip file        ############

## if not done yet, the Samsung Wearable data must be downloaded before running this code.
## To do so, remove the "#" sign from the beginning of the following 4 code-lines:

#if(!file.exists("./data")){dir.create("./data")}
#myUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(myUrl, destfile="./data/wereableDataset.zip")
#unzip(zipfile = "./data/wereableDataset.zip", exdir = "./data")



############        1) Merge the training and the test files to create one dataset        ############

## Read Training and Testing Files:

trainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt")

trainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
testY <- read.table("./data/UCI HAR Dataset/test/y_test.txt")

subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt") 


## Name columns:

colnames(trainX) <- features[,2]
colnames(testX) <- features[,2]

colnames(trainY) <- "activityNumber"
colnames(testY) <- "activityNumber"

colnames(subjectTrain) <- "subjectNumber"
colnames(subjectTest) <- "subjectNumber"

colnames(activityLabels) <- c("activityNumber","activity")


## Merge Train and Test data:


mergedTrain <- cbind(trainY,subjectTrain,trainX)
mergedTest <- cbind(testY,subjectTest,testX)
mergedComplete <- rbind(mergedTrain, mergedTest)



############        2) Extract only columns with mean and standard deviation measurements        ############

meanMeasurements <- mergedComplete[, grepl("mean", names(mergedComplete))]
stdMeasurements <- mergedComplete[, grepl("std", names(mergedComplete))]
commonData <- mergedComplete[,1:2]
meanAndStd <- cbind(commonData,meanMeasurements,stdMeasurements)



############        3) Give descriptive names to activities       ############

descriptiveNames <- merge(activityLabels, meanAndStd, by="activityNumber", all.x=TRUE)



############        4) Give descriptive names to variables        ############

## In previous steps, descriptive labels have already been given to the following variables:
## "activityNumber", "activity" and "subjectNumber"

## In order to give description names to the rest of variables, the following transformations are made:

names(descriptiveNames) <- gsub("Acc","Accelerometer", names(descriptiveNames))
names(descriptiveNames) <- gsub("Gyro","Gyroscope", names(descriptiveNames))
names(descriptiveNames) <- gsub("^t","Time", names(descriptiveNames))
names(descriptiveNames) <- gsub("Freq","Frequency", names(descriptiveNames))
names(descriptiveNames) <- gsub("^f","Frequency", names(descriptiveNames))
names(descriptiveNames) <- gsub("Mag","Magnitude", names(descriptiveNames))
names(descriptiveNames) <- gsub("std","StandardDeviation", names(descriptiveNames))
names(descriptiveNames) <- gsub("BodyBody","Body", names(descriptiveNames))


############        5) Get the average of all variables per subject and activity        ############

## dplyr functions will be used for this step:
## If not done yet, the dplyr package must be installed first.
## To do so, remove the "#" sign from the beginning of the next code-line:
# install.packages("dplyr")

library(dplyr)
avgVariables <- descriptiveNames %>% group_by(subjectNumber, activity) %>% summarise_all(list(mean))
write.table(avgVariables, file = "AverageOfAllVariables.txt", row.name = FALSE)
