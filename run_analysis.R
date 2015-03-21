library(data.table)

path = "UCI HAR Dataset/"
## Read in the metadata 
feature_names <- read.table( paste(path,"features.txt",sep=""))
activity_labels <- read.table( paste(path,"activity_labels.txt",sep=""), header = FALSE)

## Read in all of the train data
features_train <- read.table(paste(path,"train/X_train.txt",sep=""), header = FALSE)
activity_train <- read.table(paste(path,"train/y_train.txt",sep=""), header = FALSE)
subject_train <- read.table(paste(path,"train/subject_train.txt",sep=""), header = FALSE)

## Read in all of the test data
features_test <- read.table(paste(path,"test/X_test.txt",sep=""), header = FALSE)
activity_test <- read.table(paste(path,"test/y_test.txt",sep=""), header = FALSE)
subject_test <- read.table(paste(path,"test/subject_test.txt",sep=""), header = FALSE)

## Bind them each together
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train, features_test)

## Name the features a little better
colnames(features) <- t(feature_names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

## Part1: Merge the training and the test sets to create one data set.
complete_data <- cbind(features,activity,subject)

## Part2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Get the column names that match mean or std
mean_and_std_columns <- grep("mean|std", names(complete_data))
# Everything required + subject and activity
required_columns <- c(mean_and_std_columns, 562, 563)
#Compile the data with just the required measurements
mean_and_std_data <- tbl_df(complete_data[,required_columns])

## Part3: Uses descriptive activity names to name the activities in the data set
mean_and_std_data$Activity <- as.character(mean_and_std_data$Activity)
for (i in 1:6){
  ## Loop through and replace 1 with STANDING,etc from activity labels
  mean_and_std_data$Activity[mean_and_std_data$Activity == i] <- as.character(activity_labels[i,2])
}

## Part4: Appropriately labels the data set with descriptive variable names. 
## Add more informative values for some of the labels, remove duplicated info
names(mean_and_std_data)<-gsub("BodyBody", "Body-", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("^t", "Time-", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("^f", "Frequency-", names(mean_and_std_data))
names(mean_and_std_data)<-gsub("tBody", "TimeBody-", names(mean_and_std_data))
## Remove column names that look like functions()
names(mean_and_std_data)<-gsub("-mean\\(\\)", "-Mean", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("-std\\(\\)", "-STD", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("-freq\\(\\)", "-Frequency", names(mean_and_std_data), ignore.case = TRUE)
names(mean_and_std_data)<-gsub("freq\\(\\)", "-Frequency", names(mean_and_std_data), ignore.case = TRUE)
## Normalize casing 
names(mean_and_std_data)<-gsub("gravity", "Gravity", names(mean_and_std_data))

## Part5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## We need subject to be a factor
mean_and_std_data$Subject <- as.factor(mean_and_std_data$Subject)
mean_and_std_data <- data.table(mean_and_std_data)

# Now aggregate subject, activity 
exported_set <- aggregate(. ~Subject + Activity, mean_and_std_data, mean)
exported_set <- exported_set[order(exported_set$Subject,exported_set$Activity),]
write.table(exported_set, file = "exported_set.txt", row.names = FALSE)
