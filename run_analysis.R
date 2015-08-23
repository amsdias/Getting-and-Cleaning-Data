
#1. Merges the training and the test sets to create one data set.

#Read data files
library(plyr)
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
test <- read.table("test/subject_test.txt")

#Create data sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(train, test)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

#Look for columns with mean and std in the name and subset data set
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x <- x[, mean_std_features]
names(x) <- features[mean_std_features, 2]


#3. Uses descriptive activity names to name the activities in the data set.

#Get the label names from the text file and update data set
activities <- read.table("activity_labels.txt")
y[, 1] <- activities[y[, 1], 2]
names(y) <- "activity"


#4. Appropriately labels the data set with descriptive variable names.

#Update column names and cbind all data sets into one
names(subject) <- "subjects"
merged_data <- cbind(x, y, subject)


#5. From the data set in step 4, creates a second, independent tidy data set of each variable for each activity and each subject.

data <- ddply(merged_data, .(subjects, activity), function(x) colMeans(x[, 1:66]))

#Write the clean data set to disk
write.table(data, "cleandata.txt", row.name=FALSE)