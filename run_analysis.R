# run_analysis.R

#  Merge the training and the test sets to create one data set.
training = read.csv("data/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("data/train/Y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("data/train/subject_train.txt", sep="", header=FALSE)
testing = read.csv("data/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("data/test/Y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("data/test/subject_test.txt", sep="", header=FALSE)
activityLabels = read.csv("data/activity_labels.txt", sep="", header=FALSE)
allData = rbind(training, testing)

#  Extract only the measurements on the mean and standard deviation for each measurement.
features = read.csv("data/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
colsWeWant <- grep(".*Mean.*|.*Std.*", features[,2])

#  Use descriptive activity names to name the activities in the data set.
#  Appropriately label the data set with descriptive variable names. 

features <- features[colsWeWant,]

colsWeWant <- c(colsWeWant, 562, 563)

allData <- allData[,colsWeWant]

colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))
currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}
allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)
tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)

tidy[,90] = NULL
tidy[,89] = NULL

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)
