library(plyr)


# Read file training
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# Read Training Subject
subject_train <- read.table("train/subject_train.txt")

# Read file test 
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# Read test subject
subject_test <- read.table("test/subject_test.txt")

# Combine x file (Training & test)
x_data <- rbind(x_train, x_test)

# Combine y file (Training & test)
y_data <- rbind(y_train, y_test)

# Combine subject Training and subject  test
subject_data <- rbind(subject_train, subject_test)


# Read table features.txt
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_and_std_features]

# update the column names
names(x_data) <- features[mean_and_std_features, 2]

# Read  Activity label file
activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "Activity"


# Update column name
names(subject_data) <- "Subject"

# combine all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)


# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

# 66 <- 68 columns but last two (activity & subject)
tidy_data <- ddply(all_data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidy_data.txt", row.name=FALSE)