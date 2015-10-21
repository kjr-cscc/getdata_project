## setwd("C:\\Users\\ucckjr\\Dropbox\\Coursera\\Data science series\\Getting and Cleaning Data\\my coursework\\final project")


##### 1. Merge the training and test data to create one data set

## read in features.txt to use a column names for X files 
## transpose to a vector of 561 columns 
## keep only second row - is a vector of 561 strings so is suitable for column names

features <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\features.txt", header = FALSE)
tr <- t(features)
X_names <- tr[2, ]


## read in training data, adding column labels to each file
## then combine horizontally to make one training data file

train.subject <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt", header = FALSE, col.names = c("subject_number"))

train.Y <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt", header = FALSE, col.names = c("which_activity"))

train.X <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt", header = FALSE, col.names = X_names)

## X has 561 columns, so I can definitely use the 561 rows of text in features.txt as column names
## num_X_cols <- ncol(train.X)
## num_X_cols

train <- cbind(train.subject, train.Y, train.X)
## head(train, n=2)




## read in test data, adding column labels to each file
## then combine horizontally to make one test data file

test.subject <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt", header = FALSE, col.names = c("subject_number"))

test.Y <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt", header = FALSE, col.names = c("which_activity"))

test.X <- read.table(".\\UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt", header = FALSE, col.names = X_names)

test <- cbind(test.subject, test.Y, test.X)



## combine training and test data vertically - all does have 10299 rows and 563 columns as expected

all <- rbind(train, test)
## nrow(all)
## ncol(all)



##### 2. Extract only measurement means and standard deviations


library(dplyr)

all_s <- select(all, contains("std"))
ncol(all_s)

all_m <- select(all, contains("mean"))
all_m2 <- select(all_m, -contains("Freq"))
all_m3 <- select(all_m2, -contains("gravityMean"))
all_m4 <- select(all_m3, -contains("Mean.gravity"))
ncol(all_m4)

first2 <- select(all, 1:2)

## 33 means + 33 stds + first two columns yields 68 columns and still 10299 rows
to_analyze <- cbind(first2, all_m4, all_s)



##### 3. Use descriptive activity names to name the activities in the data set

## I will add a separate string column to correspond to 1-6 in the which_activity column
index <- c(1, 2, 3, 4, 5, 6)
activities <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
to_analyze$activity <- activities[match(to_analyze$which_activity, index)]

## crosstab to show assignment is correct
table(to_analyze$which_activity, to_analyze$activity)



##### 4. Descriptive variable names - done as I went along (steps 1 and 3)



##### 5. Create a second tidy data set with the average of each variable for each activity and each subject

final <- to_analyze %>% group_by(subject_number, activity) %>% summarise_each(funs(mean))
str(final)
head(final, n=10)



##### Write out the final data set as a text file for upload - create tab-delimited text file for ease of viewing

write.table(final, "project_final.txt", row.name=FALSE, sep="\t")
